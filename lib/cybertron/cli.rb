# frozen_string_literal: true

require 'cybertron/options'
require 'cybertron/version'
require 'cybertron/generate_command'
require 'thor'
require 'fileutils'
require 'rspec/core/rake_task'

module Cybertron
  # CLI class
  class CLI < Thor
    include Thor::Actions
    include Thor::RakeCompat

    RSpec::Core::RakeTask.new(:spec) do |t|
      t.rspec_opts = ['--options', './.rspec']
    end

    desc 'spec', 'Run RSpec tests for your transforms'
    def spec
      Rake::Task['spec'].invoke
    end

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
      template 'README.tt', "#{name}/README.md"
    end

    desc 'generate', 'Generate fixtures and transforms'
    subcommand 'generate', Generate
  end
end
