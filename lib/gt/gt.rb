require 'gt'
require 'thor'

module Gt
  class CLI < Thor
    desc "red WORD", "red words print." # コマンドの使用例と、概要
    def red(word) # コマンドはメソッドとして定義する
    say(word, :red)
    end
  end
end