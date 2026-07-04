RSXWeaponHud = {}

local weapons = {}
local ammoTypes = {}
local duplicateWeapons = {}
local duplicateAmmo = {}


for _, entry in ipairs(Config.Weapons) do
    local hash = joaat(entry.name)

    if weapons[hash] then
        duplicateWeapons[#duplicateWeapons + 1] = entry.name
    end

    weapons[hash] = {
        name = entry.name,
        image = entry.image,
        usesAmmo = entry.usesAmmo == true,
        defaultAmmoImage = entry.defaultAmmoImage
    }
end

for _, entry in ipairs(Config.Ammo) do
    local hash = joaat(entry.name)

    if ammoTypes[hash] then
        duplicateAmmo[#duplicateAmmo + 1] = entry.name
    end

    ammoTypes[hash] = entry.image
end

if Config.Debug then
    if #duplicateWeapons > 0 then
        print(('[rsx_weaponhud] Warning: duplicate Config.Weapons entries for: %s'):format(table.concat(duplicateWeapons, ', ')))
    end

    if #duplicateAmmo > 0 then
        print(('[rsx_weaponhud] Warning: duplicate Config.Ammo entries for: %s'):format(table.concat(duplicateAmmo, ', ')))
    end

    print(('[rsx_weaponhud] Loaded %d weapon(s) and %d ammo type(s) from config.lua'):format(#Config.Weapons, #Config.Ammo))
end

function RSXWeaponHud.Get(weaponHash)
    return weapons[weaponHash]
end

function RSXWeaponHud.GetAmmoImage(ammoHash)
    return ammoTypes[ammoHash]
end

function RSXWeaponHud.ResolveAmmoImage(ped, weaponHash, weapon)
    local ammoHash = nil
    local source = 'weapon-default'


    if type(GetPedAmmoTypeFromWeapon_2) == 'function' then
        ammoHash = GetPedAmmoTypeFromWeapon_2(ped, weaponHash)
        source = 'active-ammo-type'
    end


    if not ammoHash or ammoHash == 0 then
        ammoHash = GetPedAmmoTypeFromWeapon(ped, weaponHash)
        source = 'base-ammo-type'
    end

    local ammoImage = ammoHash and ammoTypes[ammoHash] or nil

    if not ammoImage then
        ammoImage = weapon.defaultAmmoImage or 'ammo.png'
        source = source .. ':fallback'
    end

    return ammoImage, ammoHash or 0, source
end
