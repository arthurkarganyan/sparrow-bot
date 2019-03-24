require 'telegram/bot'
require "redis"
require 'yaml'
# require 'pry'

require_relative "app/responder"

config = YAML.load_file('config.yml')

$redis = Redis.new(db: config['redis_db'])

logger = Logger.new('log/bot.log')
SECRETS_HASH = config["secrets"]

Telegram::Bot::Client.run(config["bot_token"], logger: logger, timeout: 3) do |bot|
  bot.logger.info('Bot has been started')
  loop do
    bot.fetch_updates { |msg| Responder.find_or_create(bot, msg).handle! }
    Responder.all.each do |i|
      msg = $redis.rpop("msgs_to_send:#{i.chat_id}")
      i.reply(msg) if msg
    end
  end
end

