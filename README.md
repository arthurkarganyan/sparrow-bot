Sparrow Bot
----------------------

Telegram bot as message broker

Bot name
----------------------
Search in the Telegram client for `H4glt80gsev73vdhjo73_bot`

Redis Commands for interaction
----------------------

1. Enter `redis-cli`
2. `select 1` - use 1-st DB
3. `keys *` - see all keys in current DB
4. `lrange active_responders 0 -1` - list active chats
5. `msgs_to_send:[chat_id]` - list for sending messages
6. `LPUSH msgs_to_send:[chat_id] "message to send"`
7. `DEL [key]` - drop key
8. `LRANGE received_msgs:[chat_id] 0 -1` - received messages

Authentication
----------------------
In order to begin interaction with the bot, you have to be authenticated. To do that your key should be added into `config.yml`. 
Send `/[key]` pattern to the bot in the client to begin conversation.