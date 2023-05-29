require 'telegram/bot'

require './quiz/runner'

token = '6026612352:AAFQcPj9x6mPWgIfyLEwSVhG6AhGhk-r7vE'

Telegram::Bot::Client.run(token) do |bot|
  runner_quiz = QuizHM::Runner.new(bot)
  runner_quiz.run
end
