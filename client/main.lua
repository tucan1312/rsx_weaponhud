local UNARMED = joaat('WEAPON_UNARMED')

local state = {}
local lastWeaponTrace = nil
local lastLookupTrace = nil
local lastAmmoTrace = nil
local lastAmmoTypeTrace = nil
local lastBlockTrace = nil
local editModeActive = false



local function hashToHex(hash)
    if type(hash) ~= 'number' then
        return 'nil'
    end

    return string.format('0x%08X', hash & 0xFFFFFFFF)
end

local function debugPrint(message, ...)
    if not Config.Debug then
        return
    end

    if select('#', ...) > 0 then
        message = string.format(message, ...)
    end

    print(('[rsx_weaponhud] %s'):format(message))
end

local function traceWeaponNative(success, weaponHash)
    local trace = ('%s:%s'):format(tostring(success), tostring(weaponHash))

    if trace == lastWeaponTrace then
        return
    end

    lastWeaponTrace = trace
    debugPrint('GetCurrentPedWeapon => success=%s, hash=%s (%s)', tostring(success), tostring(weaponHash), hashToHex(weaponHash))
end

local function traceWeaponLookup(weaponHash, weapon)
    local trace = weaponHash and ('%s:%s'):format(tostring(weaponHash), weapon and weapon.image or 'unmapped') or 'none'

    if trace == lastLookupTrace then
        return
    end

    lastLookupTrace = trace

    if not weaponHash then
        debugPrint('No equipped weapon detected. HUD hidden.')
        return
    end

    if not weapon then
        debugPrint('Weapon %s is not mapped in config.lua. HUD hidden.', hashToHex(weaponHash))
        return
    end

    debugPrint(
        'Weapon mapped: hash=%s, name=%s, image=%s, usesAmmo=%s',
        hashToHex(weaponHash),
        weapon.name,
        weapon.image,
        tostring(weapon.usesAmmo)
    )
end

local function traceAmmo(weaponHash, ammo)
    local trace = ('%s:%s'):format(tostring(weaponHash), tostring(ammo))

    if trace == lastAmmoTrace then
        return
    end

    lastAmmoTrace = trace
    debugPrint('Ammo read for %s => %s', hashToHex(weaponHash), tostring(ammo))
end

local function traceAmmoType(ammoHash, ammoImage, source)
    local trace = ('%s:%s:%s'):format(tostring(ammoHash), tostring(ammoImage), tostring(source))

    if trace == lastAmmoTypeTrace then
        return
    end

    lastAmmoTypeTrace = trace
    debugPrint('Ammo image: type=%s (%s), image=%s, source=%s', hashToHex(ammoHash), tostring(ammoHash), ammoImage, source)
end

local function traceBlock(reason)
    if reason == lastBlockTrace then
        return
    end

    lastBlockTrace = reason

    if reason then
        debugPrint('%s HUD hidden.', reason)
    end
end

local function push(visible, weaponImage, ammoImage, ammo, showAmmo)
    if state.visible == visible
        and state.weaponImage == weaponImage
        and state.ammoImage == ammoImage
        and state.ammo == ammo
        and state.showAmmo == showAmmo then
        return
    end

    state.visible = visible
    state.weaponImage = weaponImage
    state.ammoImage = ammoImage
    state.ammo = ammo
    state.showAmmo = showAmmo

    debugPrint(
        'SendNUIMessage => visible=%s, weapon=%s, ammoImage=%s, ammo=%s, showAmmo=%s',
        tostring(visible),
        tostring(weaponImage),
        tostring(ammoImage),
        tostring(ammo or 0),
        tostring(showAmmo == true)
    )

    SendNUIMessage({
        action = 'weaponHud',
        visible = visible,
        weaponImage = weaponImage,
        ammoImage = ammoImage,
        ammo = ammo or 0,
        showAmmo = showAmmo == true
    })
end

local function getEquippedWeapon(ped)
    -- RDR3: 0 = primary attach point / weapon in hand.
    local success, weaponHash = GetCurrentPedWeapon(ped, false, 0, false)
    traceWeaponNative(success, weaponHash)

    if not success or not weaponHash or weaponHash == 0 or weaponHash == UNARMED then
        return nil
    end

    return weaponHash
end


local function isMinimapHidden()
    if not Config.HideWhenMinimapHidden then
        return false
    end

    local ok, hidden = pcall(function()
        if IsRadarHidden then
            return IsRadarHidden() == true
        end
        return false
    end)

    if ok and hidden then
        return true
    end

    local ok2, rendering = pcall(function()
        if IsMinimapRendering then
            return IsMinimapRendering() == true
        end
        return true
    end)

    if ok2 and not rendering then
        return true
    end

    return false
end

RegisterNUICallback('ready', function(_, cb)
    debugPrint('NUI READY callback received. HTML, CSS and app.js loaded successfully.')

    local savedPos = GetResourceKvpString(Config.EditHudKvpKey)
    if savedPos then
        local ok, decoded = pcall(json.decode, savedPos)
        if ok and decoded and decoded.x and decoded.y then
            debugPrint('Restoring saved HUD position: x=%.2f%%, y=%.2f%%', decoded.x, decoded.y)
            SendNUIMessage({
                action = 'weaponHudPosition',
                position = { xPercent = decoded.x, yPercent = decoded.y }
            })
        end
    end

    cb({ ok = true })
end)

RegisterNUICallback('saveHudPosition', function(data, cb)
    if data and type(data.xPercent) == 'number' and type(data.yPercent) == 'number' then
        SetResourceKvp(Config.EditHudKvpKey, json.encode({ x = data.xPercent, y = data.yPercent }))
        debugPrint('Saved HUD position: x=%.2f%%, y=%.2f%%', data.xPercent, data.yPercent)
    end

    cb({ ok = true })
end)


local function resetHudCache()
    state = {}
    lastWeaponTrace = nil
    lastLookupTrace = nil
    lastAmmoTrace = nil
    lastAmmoTypeTrace = nil
    lastBlockTrace = nil
end


RegisterCommand(Config.EditHudCommand, function()
    editModeActive = not editModeActive

    SetNuiFocus(editModeActive, editModeActive)

    SendNUIMessage({
        action = 'weaponHudEditMode',
        enabled = editModeActive
    })

    if not editModeActive then
        resetHudCache()
    end
end, false)


RegisterNUICallback('closeEditMode', function(_, cb)
    if editModeActive then
        editModeActive = false
        SetNuiFocus(false, false)
        
        SendNUIMessage({
            action = 'weaponHudEditMode',
            enabled = false
        })
        
        resetHudCache()
    end
    cb({ ok = true })
end)

CreateThread(function()
    debugPrint('Client started. Waiting for player and NUI.')
    push(false)

    while true do
        local ped = PlayerPedId()

        if IsEntityDead(ped) or IsPauseMenuActive() then
            if IsEntityDead(ped) then
                traceBlock('Player is dead.')
            else
                traceBlock('Pause menu active.')
            end

            push(false)
            Wait(Config.IdlePollInterval)
        elseif isMinimapHidden() then
            traceBlock('Minimap is hidden.')
            push(false)
            Wait(Config.IdlePollInterval)
        else
            traceBlock(nil)

            local weaponHash = getEquippedWeapon(ped)
            local weapon = weaponHash and RSXWeaponHud.Get(weaponHash) or nil
            traceWeaponLookup(weaponHash, weapon)

            if not weapon then
                push(false)
            else
                local ammo = 0
                local ammoImage = nil

                if weapon.usesAmmo then
                    ammo = math.max(0, GetAmmoInPedWeapon(ped, weaponHash) or 0)

                    local ammoHash, source
                    ammoImage, ammoHash, source = RSXWeaponHud.ResolveAmmoImage(ped, weaponHash, weapon)

                    traceAmmo(weaponHash, ammo)
                    traceAmmoType(ammoHash, ammoImage, source)
                end

                push(true, weapon.image, ammoImage, ammo, weapon.usesAmmo)
            end

            Wait(Config.PollInterval)
        end
    end
end)




AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        debugPrint('Resource stopping. Hiding NUI.')
        SendNUIMessage({ action = 'weaponHud', visible = false })

        if editModeActive then
            SetNuiFocus(false, false)
        end
    end
end)
