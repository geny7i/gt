require 'gt'
require 'thor'
require "open3"

module Gt
  class CLI < Thor
    desc "init", "initialize git repo with User setting"
    option :user, aliases: :u
    def init
      say(options[:user])
    end

    desc "set", "initialize git repo with User setting"
    option :user, aliases: :u
    def set
      user = get_user(options[:user])
      run_command("git config --local user.name #{user[:name]}")
      run_command("git config --local user.email #{user[:email]}")
    end

    private
    def run_command(cmd)
      `#{cmd}`
    end

    def get_user(key)
      user = users.find{ |k,_| k.to_s == key.to_s }.then(&:last)
      raise unless user
      user
    end

    def users
      {
        geny7i: {
          name:  'geny7i',
          email: '38778469+geny7i@users.noreply.github.com'
        }
      }
    end
  end
end