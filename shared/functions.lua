function clearChat()
    TriggerEvent('chat:clear')
    TriggerEvent('server-utilities:Notify_Standard', 'The chat has been cleared, as well as any command history.')
end
