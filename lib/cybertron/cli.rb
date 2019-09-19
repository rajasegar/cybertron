# frozen_string_literal: true

require 'optparse'
require 'cybertron/options'
require 'cybertron/version'
require 'cybertron/generate_command'
require 'thor'
require 'fileutils'

module Cybertron
  # CLI class
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path('../templates', __dir__)
    end

    desc 'new <project-name>', 'Create a new Codemod project'
    def new(name)
      puts "Creating new project: #{name}"
      FileUtils.mkdir_p "#{name}/transforms"
      FileUtils.mkdir_p "#{name}/spec"
      template 'rspec.tt', "#{name}/.rspec"
      template 'spec_helper.tt', "#{name}/spec/spec_helper.rb"
      template 'Rakefile.tt', "#{name}/Rakefile"
      template 'readme.tt', "#{name}/README.md"
    end

    desc 'generate', 'Generate fixtures and transforms'
    subcommand 'generate', Generate

  end
end
