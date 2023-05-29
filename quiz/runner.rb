require_relative 'quiz'
require_relative 'input_reader'
require_relative 'file_writer'
require_relative 'statistics'
require_relative 'engine'

module QuizHM
  class Runner
    def initialize(bot)
      @quiz = Quiz.instance
      @input_reader = InputReader.new
      @bot = bot
    end

    def run
      @bot.listen do |message|
        case message.text
        when '/start'
          username = message.from.first_name + " " + message.from.last_name
          start_time = Time.now
          answer =
          Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [{text: "Let's-a-go!"}],
            ],
            one_time_keyboard: true
          )
          "Вітаємо, " + text = username + "!\n/start для початку тесту.\n/stop для передчасної зупинки тесту."
          @bot.api.send_message(chat_id: message.chat.id, text: , reply_markup: answer)
          engine = Engine.new(@bot, message.chat.id, username)
          engine.start_bot

        when '/stop'
          result = engine #.result
          end_time = Time.now

          puts start_time
          puts end_time

          @bot.api.send_message(chat_id: message.chat.id, text: "See you later, #{message.from.first_name}")
        else
          answer =
          Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [{text: "/start"}],
              [{text: "/stop"}]
            ],
            one_time_keyboard: true
          )
          @bot.api.send_message(chat_id: message.chat.id, text: "почнімо", reply_markup: answer)
        end
      end
    end
  end
end
  