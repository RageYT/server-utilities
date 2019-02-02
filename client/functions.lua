function showStandardNotification(notification_message)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringWebsite(notification_message)
    DrawNotification(false, true)
end

function cc()
    TriggerEvent('chat:clear')
    showStandardNotification("The chat has been cleared.")
end
