Config = {}

-- ============================================================
-- GENERAL
-- ============================================================

Config.Debug = false          -- set true to print trace logs to the client console
Config.PollInterval = 100     -- ms between weapon/ammo checks
Config.IdlePollInterval = 500 -- ms between checks while the HUD is force-hidden (dead/pause menu/minimap hidden)

-- Hide the HUD whenever the minimap/radar is not on screen
Config.HideWhenMinimapHidden = true

-- ============================================================
-- HUD POSITION EDITOR
-- ============================================================

-- Command players type to toggle drag-to-move edit mode for the HUD
-- (e.g. typing "/edithud" in chat 0r f8).
Config.EditHudCommand = 'edithud'

-- Key used to store each player's saved HUD position locally (KVP).
-- Only change this if you need to reset everyone's saved position.
Config.EditHudKvpKey = 'rsx_weaponhud_position'

-- ============================================================
-- WEAPONS
-- ============================================================

Config.Weapons = {
    -- Revolvers
    { name = 'WEAPON_REVOLVER_CATTLEMAN',            image = 'weapon_revolver_cattleman.png',            usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_CATTLEMAN_JOHN',        image = 'weapon_revolver_cattleman.png',            usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_CATTLEMAN_MEXICAN',     image = 'weapon_revolver_cattleman_mexican.png',    usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_DOUBLEACTION',          image = 'weapon_revolver_doubleaction.png',         usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_DOUBLEACTION_GAMBLER',  image = 'weapon_revolver_doubleaction_gambler.png', usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_LEMAT',                 image = 'weapon_revolver_lemat.png',                usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_NAVY',                  image = 'weapon_revolver_navy.png',                 usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_NAVY_CROSSOVER',        image = 'weapon_revolver_navy_crossover.png',       usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_SCHOFIELD',             image = 'weapon_revolver_schofield.png',            usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },
    { name = 'WEAPON_REVOLVER_SCHOFIELD_CALLOWAY',    image = 'weapon_revolver_schofield.png',            usesAmmo = true,  defaultAmmoImage = 'ammo_revolver.png' },

    -- Pistols
    { name = 'WEAPON_PISTOL_M1899',    image = 'weapon_pistol_m1899.png',    usesAmmo = true, defaultAmmoImage = 'ammo_pistol.png' },
    { name = 'WEAPON_PISTOL_MAUSER',   image = 'weapon_pistol_mauser.png',   usesAmmo = true, defaultAmmoImage = 'ammo_pistol.png' },
    { name = 'WEAPON_PISTOL_SEMIAUTO', image = 'weapon_pistol_semiauto.png', usesAmmo = true, defaultAmmoImage = 'ammo_pistol.png' },
    { name = 'WEAPON_PISTOL_VOLCANIC', image = 'weapon_pistol_volcanic.png', usesAmmo = true, defaultAmmoImage = 'ammo_pistol.png' },

    -- Repeaters
    { name = 'WEAPON_REPEATER_CARBINE',    image = 'weapon_repeater_carbine.png',    usesAmmo = true, defaultAmmoImage = 'ammo_repeater.png' },
    { name = 'WEAPON_REPEATER_EVANS',      image = 'weapon_repeater_evans.png',      usesAmmo = true, defaultAmmoImage = 'ammo_repeater.png' },
    { name = 'WEAPON_REPEATER_HENRY',      image = 'weapon_repeater_henry.png',      usesAmmo = true, defaultAmmoImage = 'ammo_repeater.png' },
    { name = 'WEAPON_REPEATER_LANCASTER',  image = 'weapon_repeater_lancaster.png',  usesAmmo = true, defaultAmmoImage = 'ammo_repeater.png' },
    { name = 'WEAPON_REPEATER_LITCHFIELD', image = 'weapon_repeater_litchfield.png', usesAmmo = true, defaultAmmoImage = 'ammo_repeater.png' },
    { name = 'WEAPON_REPEATER_WINCHESTER', image = 'weapon_repeater_winchester.png', usesAmmo = true, defaultAmmoImage = 'ammo_repeater.png' },

    -- Rifles
    { name = 'WEAPON_RIFLE_BOLTACTION',  image = 'weapon_rifle_boltaction.png',  usesAmmo = true, defaultAmmoImage = 'ammo_rifle.png' },
    { name = 'WEAPON_RIFLE_ELEPHANT',    image = 'weapon_rifle_elephant.png',    usesAmmo = true, defaultAmmoImage = 'ammo_rifle_elephant.png' },
    { name = 'WEAPON_RIFLE_SPRINGFIELD', image = 'weapon_rifle_springfield.png', usesAmmo = true, defaultAmmoImage = 'ammo_rifle.png' },
    { name = 'WEAPON_RIFLE_VARMINT',     image = 'weapon_rifle_varmint.png',     usesAmmo = true, defaultAmmoImage = 'ammo_22.png' },

    -- Shotguns
    { name = 'WEAPON_SHOTGUN_DOUBLEBARREL',        image = 'weapon_shotgun_doublebarrel.png',        usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },
    { name = 'WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC', image = 'weapon_shotgun_doublebarrel_exotic.png', usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },
    { name = 'WEAPON_SHOTGUN_PUMP',                image = 'weapon_shotgun_pump.png',                usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },
    { name = 'WEAPON_SHOTGUN_PUMP_WORN',           image = 'weapon_shotgun_pump.png',                usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },
    { name = 'WEAPON_SHOTGUN_REPEATING',           image = 'weapon_shotgun_repeating.png',           usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },
    { name = 'WEAPON_SHOTGUN_SAWEDOFF',            image = 'weapon_shotgun_sawedoff.png',            usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },
    { name = 'WEAPON_SHOTGUN_SAWEDOFF_WORN',       image = 'weapon_shotgun_sawedoff.png',            usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },
    { name = 'WEAPON_SHOTGUN_SEMIAUTO',            image = 'weapon_shotgun_semiauto.png',            usesAmmo = true, defaultAmmoImage = 'ammo_shotgun.png' },

    -- Snipers and bows
    { name = 'WEAPON_SNIPERRIFLE_CARCANO',      image = 'weapon_sniperrifle_carcano.png',      usesAmmo = true, defaultAmmoImage = 'ammo_rifle.png' },
    { name = 'WEAPON_SNIPERRIFLE_ROLLINGBLOCK', image = 'weapon_sniperrifle_rollingblock.png', usesAmmo = true, defaultAmmoImage = 'ammo_rifle.png' },
    { name = 'WEAPON_BOW',                      image = 'weapon_bow.png',                      usesAmmo = true, defaultAmmoImage = 'ammo_arrow.png' },
    { name = 'WEAPON_BOW_IMPROVED',             image = 'weapon_bow_improved.png',             usesAmmo = true, defaultAmmoImage = 'ammo_arrow.png' },

    -- Throwables
    { name = 'WEAPON_THROWN_BOLAS',             image = 'weapon_thrown_bolas.png',             usesAmmo = true, defaultAmmoImage = 'ammo_bola.png' },
    { name = 'WEAPON_THROWN_BOLAS_HAWKMOTH',    image = 'weapon_thrown_bolas_hawkmoth.png',    usesAmmo = true, defaultAmmoImage = 'ammo_bola_hawkmoth.png' },
    { name = 'WEAPON_THROWN_BOLAS_INTERTWINED', image = 'weapon_thrown_bolas_interwined.png',  usesAmmo = true, defaultAmmoImage = 'ammo_bola_interwired.png' },
    { name = 'WEAPON_THROWN_BOLAS_INTERWIRED',  image = 'weapon_thrown_bolas_interwined.png',  usesAmmo = true, defaultAmmoImage = 'ammo_bola_interwired.png' },
    { name = 'WEAPON_THROWN_BOLAS_IRONSPIKED',  image = 'weapon_thrown_bolas_ironspiked.png',  usesAmmo = true, defaultAmmoImage = 'ammo_bola_ironspiked.png' },
    { name = 'WEAPON_THROWN_DYNAMITE',          image = 'weapon_thrown_dynamite.png',          usesAmmo = true, defaultAmmoImage = 'ammo_dynamite.png' },
    { name = 'WEAPON_THROWN_MOLOTOV',           image = 'weapon_thrown_molotov.png',           usesAmmo = true, defaultAmmoImage = 'ammo_molotov.png' },
    { name = 'WEAPON_THROWN_POISONBOTTLE',      image = 'weapon_thrown_poisonbottle.png',      usesAmmo = true, defaultAmmoImage = 'ammo_poisonbottle.png' },
    { name = 'WEAPON_THROWN_KNIFE',             image = 'weapon_thrown_throwing_knives.png',   usesAmmo = true, defaultAmmoImage = 'ammo_throwing_knifes.png' },
    { name = 'WEAPON_THROWN_KNIFE_JAVIER',      image = 'weapon_thrown_throwing_knives.png',   usesAmmo = true, defaultAmmoImage = 'ammo_throwing_knifes.png' },
    { name = 'WEAPON_THROWN_TOMAHAWK',          image = 'weapon_thrown_tomahawk.png',          usesAmmo = true, defaultAmmoImage = 'ammo_tomahawk.png' },
    { name = 'WEAPON_THROWN_TOMAHAWK_ANCIENT',  image = 'weapon_thrown_tomahawk.png',          usesAmmo = true, defaultAmmoImage = 'ammo_tomahawk.png' },

    -- Melee and utility (no ammo pill)
    { name = 'WEAPON_MELEE_CLEAVER',                  image = 'weapon_melee_cleaver.png',            usesAmmo = false },
    { name = 'WEAPON_MELEE_HAMMER',                   image = 'weapon_melee_hammer.png',             usesAmmo = false },
    { name = 'WEAPON_MELEE_HATCHET',                  image = 'weapon_melee_hatchet_double_bit.png', usesAmmo = false },
    { name = 'WEAPON_MELEE_HATCHET_DOUBLEBIT',        image = 'weapon_melee_hatchet_double_bit.png', usesAmmo = false },
    { name = 'WEAPON_MELEE_HATCHET_DOUBLEBIT_RUSTED', image = 'weapon_melee_hatchet_double_bit.png', usesAmmo = false },
    { name = 'WEAPON_MELEE_HATCHET_HUNTER',           image = 'weapon_melee_hatchet_hunter.png',     usesAmmo = false },
    { name = 'WEAPON_MELEE_HATCHET_HEWING',           image = 'weapon_melee_hatchet_stone.png',      usesAmmo = false },
    { name = 'WEAPON_MELEE_HATCHET_VIKING',           image = 'weapon_melee_hatchet_viking.png',     usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE',                    image = 'weapon_melee_knife.png',              usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE_JOHN',               image = 'weapon_melee_knife.png',              usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE_MINER',              image = 'weapon_melee_knife.png',              usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE_CIVIL_WAR',          image = 'weapon_melee_knife_civil_war.png',    usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE_BEAR',               image = 'weapon_melee_knife_horror.png',       usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE_JAWBONE',            image = 'weapon_melee_knife_jawbone.png',      usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE_VAMPIRE',            image = 'weapon_melee_knife_rustic.png',       usesAmmo = false },
    { name = 'WEAPON_MELEE_KNIFE_TRADER',             image = 'weapon_melee_knife_trader.png',       usesAmmo = false },
    { name = 'WEAPON_MELEE_MACHETE',                  image = 'weapon_melee_machete.png',            usesAmmo = false },
    { name = 'WEAPON_MELEE_MACHETE_COLLECTOR',        image = 'weapon_melee_machete_collector.png',  usesAmmo = false },
    { name = 'WEAPON_MELEE_MACHETE_HORROR',           image = 'weapon_melee_machete_zavala.png',     usesAmmo = false },
    { name = 'WEAPON_MELEE_DAGGER',                   image = 'weapon_melee_ornate_dagger.png',      usesAmmo = false },
    { name = 'WEAPON_MELEE_BROKEN_SWORD',             image = 'weapon_melee_sword_broken_pirate.png',usesAmmo = false },
    { name = 'WEAPON_MELEE_TORCH',                    image = 'weapon_melee_torch.png',              usesAmmo = false },
    { name = 'WEAPON_LASSO',                          image = 'weapon_lasso.png',                    usesAmmo = false },
    { name = 'WEAPON_LASSO_REINFORCED',               image = 'weapon_lasso_reinforced.png',         usesAmmo = false },
    { name = 'WEAPON_FISHINGROD',                     image = 'weapon_fishingrod.png',               usesAmmo = false },
    { name = 'WEAPON_KIT_BINOCULARS',                 image = 'weapon_kit_binoculars.png',           usesAmmo = false },
    { name = 'WEAPON_KIT_BINOCULARS_IMPROVED',        image = 'weapon_kit_binoculars_improved.png',  usesAmmo = false },
    { name = 'WEAPON_KIT_CAMERA',                     image = 'weapon_kit_camera.png',               usesAmmo = false },
    { name = 'WEAPON_KIT_CAMERA_ADVANCED',            image = 'weapon_kit_camera_advanced.png',      usesAmmo = false },
    { name = 'WEAPON_LANTERN',                        image = 'weapon_melee_lantern.png',            usesAmmo = false },
    { name = 'WEAPON_MELEE_DAVY_LANTERN',             image = 'weapon_melee_lantern_davy.png',       usesAmmo = false },
    { name = 'WEAPON_LANTERN_ELECTRIC',               image = 'weapon_melee_lantern_electric.png',   usesAmmo = false },
    { name = 'WEAPON_LANTERN_HALLOWEEN',              image = 'weapon_melee_lantern_halloween.png',  usesAmmo = false },
}

-- ============================================================
-- AMMO TYPES
-- ============================================================

Config.Ammo = {
    -- Revolver
    { name = 'AMMO_REVOLVER',                  image = 'ammo_revolver.png' },
    { name = 'AMMO_REVOLVER_EXPRESS',          image = 'ammo_revolver_express.png' },
    { name = 'AMMO_REVOLVER_EXPRESS_EXPLOSIVE',image = 'ammo_revolver_epress_explosive.png' },
    { name = 'AMMO_REVOLVER_HIGH_VELOCITY',    image = 'ammo_revolver_high_velocity.png' },
    { name = 'AMMO_REVOLVER_SPLIT_POINT',      image = 'ammo_revolver_split_point.png' },

    -- Pistol
    { name = 'AMMO_PISTOL',                   image = 'ammo_pistol.png' },
    { name = 'AMMO_PISTOL_EXPRESS',           image = 'ammo_pistol_express.png' },
    { name = 'AMMO_PISTOL_EXPRESS_EXPLOSIVE', image = 'ammo_pistol_express_explosive.png' },
    { name = 'AMMO_PISTOL_HIGH_VELOCITY',     image = 'ammo_pistol_high_velocity.png' },
    { name = 'AMMO_PISTOL_SPLIT_POINT',       image = 'ammo_pistol_split_point.png' },

    -- Repeater
    { name = 'AMMO_REPEATER',                    image = 'ammo_repeater.png' },
    { name = 'AMMO_REPEATER_EXPRESS',            image = 'ammo_repeater_express.png' },
    { name = 'AMMO_REPEATER_EXPRESS_EXPLOSIVE',  image = 'ammo_repeater_explosive.png' },
    { name = 'AMMO_REPEATER_EXPLOSIVE',          image = 'ammo_repeater_explosive.png' },
    { name = 'AMMO_REPEATER_HIGH_VELOCITY',      image = 'ammo_repeater_high_velocity.png' },
    { name = 'AMMO_REPEATER_SPLIT_POINT',        image = 'ammo_repeater_split_point.png' },

    -- Rifle / generic bullet
    { name = 'AMMO_RIFLE',                    image = 'ammo_rifle.png' },
    { name = 'AMMO_RIFLE_EXPRESS',             image = 'ammo_rifle_express.png' },
    { name = 'AMMO_RIFLE_EXPRESS_EXPLOSIVE',   image = 'ammo_rifle_express_explosive.png' },
    { name = 'AMMO_RIFLE_HIGH_VELOCITY',       image = 'ammo_rifle_high_velocity.png' },
    { name = 'AMMO_RIFLE_SPLIT_POINT',         image = 'ammo_rifle_split_point.png' },
    { name = 'AMMO_RIFLE_ELEPHANT',            image = 'ammo_rifle_elephant.png' },
    { name = 'AMMO_ELEPHANT_RIFLE',            image = 'ammo_rifle_elephant.png' },
    { name = 'AMMO_22',                        image = 'ammo_22.png' },
    { name = 'AMMO_22_TRANQUILIZER',           image = 'ammo_22_tranquilizer.png' },
    { name = 'AMMO_RIFLE_VARMINT',             image = 'ammo_bullet_varmin.png' },
    { name = 'AMMO_BULLET_NORMAL',             image = 'ammo_bullet_normal.png' },
    { name = 'AMMO_BULLET_EXPRESS',            image = 'ammo_bullet_express.png' },
    { name = 'AMMO_BULLET_HIGH_VELOCITY',      image = 'ammo_bullet_high_velocity.png' },
    { name = 'AMMO_BULLET_SPLIT_POINT',        image = 'ammo_bullet_split_point.png' },
    { name = 'AMMO_BULLET_EXPLOSIVE',          image = 'ammo_bullet_explosive.png' },

    -- Shotgun
    { name = 'AMMO_SHOTGUN',                        image = 'ammo_shotgun.png' },
    { name = 'AMMO_SHOTGUN_BUCKSHOT_INCENDIARY',    image = 'ammo_shotgun_buckshot_incendiary.png' },
    { name = 'AMMO_SHOTGUN_SLUG',                   image = 'ammo_shotgun_slug.png' },
    { name = 'AMMO_SHOTGUN_SLUG_EXPLOSIVE',         image = 'ammo_shotgun_slug_explosive.png' },

    -- Arrows
    { name = 'AMMO_ARROW',            image = 'ammo_arrow.png' },
    { name = 'AMMO_ARROW_CONFUSION',  image = 'ammo_arrow_confusion.png' },
    { name = 'AMMO_ARROW_DISORIENT',  image = 'ammo_arrow_disorient.png' },
    { name = 'AMMO_ARROW_DRAIN',      image = 'ammo_arrow_drain.png' },
    { name = 'AMMO_ARROW_DYNAMITE',   image = 'ammo_arrow_dynamite.png' },
    { name = 'AMMO_ARROW_FIRE',       image = 'ammo_arrow_fire.png' },
    { name = 'AMMO_ARROW_IMPROVED',   image = 'ammo_arrow_improved.png' },
    { name = 'AMMO_ARROW_POISON',     image = 'ammo_arrow_poison.png' },
    { name = 'AMMO_ARROW_SMALL_GAME', image = 'ammo_arrow_small_game.png' },
    { name = 'AMMO_ARROW_TRACKING',   image = 'ammo_arrow_tracking.png' },
    { name = 'AMMO_ARROW_TRAIL',      image = 'ammo_arrow_trail.png' },
    { name = 'AMMO_ARROW_WOUND',      image = 'ammo_arrow_wound.png' },

    -- Bolas
    { name = 'AMMO_BOLAS',             image = 'ammo_bola.png' },
    { name = 'AMMO_BOLAS_HAWKMOTH',    image = 'ammo_bola_hawkmoth.png' },
    { name = 'AMMO_BOLAS_INTERTWINED', image = 'ammo_bola_interwired.png' },
    { name = 'AMMO_BOLAS_INTERWIRED',  image = 'ammo_bola_interwired.png' },
    { name = 'AMMO_BOLAS_IRONSPIKED',  image = 'ammo_bola_ironspiked.png' },

    -- Thrown explosives / poison
    { name = 'AMMO_DYNAMITE',          image = 'ammo_dynamite.png' },
    { name = 'AMMO_DYNAMITE_VOLATILE', image = 'ammo_dynamite_volatile.png' },
    { name = 'AMMO_MOLOTOV',           image = 'ammo_molotov.png' },
    { name = 'AMMO_MOLOTOV_VOLATILE',  image = 'ammo_molotov_volatile.png' },
    { name = 'AMMO_POISONBOTTLE',      image = 'ammo_poisonbottle.png' },

    -- Throwing knives
    { name = 'AMMO_THROWING_KNIVES',            image = 'ammo_throwing_knifes.png' },
    { name = 'AMMO_THROWING_KNIVES_CONFUSE',    image = 'ammo_throwing_knives_confuse.png' },
    { name = 'AMMO_THROWING_KNIVES_CONFUSION',  image = 'ammo_throwing_knives_confuse.png' },
    { name = 'AMMO_THROWING_KNIVES_DISORIENT',  image = 'ammo_throwing_knives_disorient.png' },
    { name = 'AMMO_THROWING_KNIVES_DRAIN',      image = 'ammo_throwing_knives_drain.png' },
    { name = 'AMMO_THROWING_KNIVES_IMPROVED',   image = 'ammo_throwing_knives_improved.png' },
    { name = 'AMMO_THROWING_KNIVES_POISON',     image = 'ammo_throwing_knives_poison.png' },
    { name = 'AMMO_THROWING_KNIVES_TRAIL',      image = 'ammo_throwing_knives_trail.png' },
    { name = 'AMMO_THROWING_KNIVES_WOUND',      image = 'ammo_throwing_knives_wound.png' },

    -- Tomahawk
    { name = 'AMMO_TOMAHAWK',          image = 'ammo_tomahawk.png' },
    { name = 'AMMO_TOMAHAWK_ANCIENT',  image = 'ammo_tomahawk_ancient.png' },
    { name = 'AMMO_TOMAHAWK_HOMING',   image = 'ammo_tomahawk_homing.png' },
    { name = 'AMMO_TOMAHAWK_IMPROVED', image = 'ammo_tomahawk_improved.png' },
}
