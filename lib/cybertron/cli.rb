# frozen_string_literal: true

require 'optparse'
require 'cybertron/options'
require 'cybertron/version'

module Cybertron
  class CLI
    def initialize
      @options = Cybertron::Options.new
      OptionParser.new do |opts|
        opts.banner = 'Usage: cybertron new <transform-name>'

        opts.on('--version', 'Print version number') do
          puts Cybertron::VERSION
          exit
        end

        opts.on('-h', '--help', 'Prints help') do
          puts opts
          exit
        end


      end.parse!
    end
  end
end
