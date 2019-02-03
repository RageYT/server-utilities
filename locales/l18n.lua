local locales = {}
local selected_locale = nil

function registerLocale(language, locale)
    if locales[language] == nil then
        locales[language] = {}
    end

    for key, value in pairs(locale) do
        locales[language][key] = value
    end
end

function getRegisteredLocales()
    return locales
end

function selectLocale(language_key)
    if not locales[language_key] then
        return error({ code = '18ILS', message = 'Invalid locale'})
    end

    selected_locale = language_key
end

function getSelectedLocale()
    return selected_locale
end

function _(key, replacements)
    if not selected_locale then
        return 'No locale selected. Fire selectLocale(KEY)'
    end

    if not locales[selected_locale] then
        return 'Invalid locale ' .. selected_locale
    end

    local result = locales[selected_locale][key]

    if not result then
        return 'Unknown key [' .. key .. '] for locale [' .. selected_locale .. ']'
    end

    if not replacements then
        return result
    end

    for ignored_par, replacement in pairs(replacements) do
        result = result:gsub('%$' .. replacement[1], replacement[2])
    end

    return result
end