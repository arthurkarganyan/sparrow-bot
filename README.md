Sparrow Bot
----------------------

Telegram bot as message broker

bot name:
`H4glt80gsev73vdhjo73_bot`

Add to redis
----------------------

`msgs_to_send:[chat_id]` - list for sending messages

Example:
`LPUSH msgs_to_send:[chat_id] "message to send"`

`LRANGE active_responders 0 -1` - list active chats

`DEL [key]` - drop key