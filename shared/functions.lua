function clearChat()
    TriggerEvent('chat:clear')
    TriggerEvent('server-utilities:Notify_Standard', _('clear_chat_success'))
end
