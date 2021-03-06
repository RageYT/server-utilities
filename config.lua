--============================================================
-- Leave this as is, it does not need to be touched or edited
--============================================================
config = {}

--=============================================================
-- Selects a locale file from the locales folder. If you would
-- like to create one and include it within the resource, make
-- a pull request on the GitHub with a translate version.
--=============================================================
config.locale = 'en'

--======================================================================================================================
-- The ^ are for color coding, if you want to change the colors use the color codes below; Thanks to Auxi for the guide
-- provided on the FiveM Forums (https://forum.fivem.net/t/how-to-change-your-servernames-color/200)
--======================================================================================================================
-- ^0 is White
-- ^1 is Red (#ff4444)
-- ^2 is Green/Lime (#99cc00)
-- ^3 is Orange (#ffbb33)
-- ^4 is Blue (#0099cc)
-- ^5 is Light Blue (#33b5e5)
-- ^6 is Purple (#aa66cc)
-- ^7 is White
--============================
config.prefix = "^4[^1Server^4] ^7"

--=====================================================================================
-- This is the list of weapons provided for the default resources, you can add more by
-- copying the example below. You can find the weapon hashes on this website. Don't
-- forget, when you add more weapons make sure to always include the , at the end. You
-- can see this below, the last line doesn't need a ,.
--=====================================================================================
-- Example:
-- carbinerifle = "weapon_carbinerifle",
--=======================================
config.weapons = {
    assaultrifle = "weapon_assaultrifle",
    pistol = "weapon_pistol",
    carbinerifle = "weapon_carbinerifle"
}

--===========================================================================
-- The list of ads are provided below, providing custom made
-- ads for different things. Use the example provided to make you're own ad.
--===========================================================================
-- To add you're own ad, refer to the wiki page on how to create one.
-- https://github.com/RageYT/server-utilities/wiki/Guides#adding-new-ads
--=======================================================================
config.ads = {
    cab = { 'CHAR_TAXI', 'Downtown Cab Co.' }
}

--==========================================================
-- Leave this be, it autoselects the set locale from above.
--==========================================================
selectLocale(config.locale)
