# frozen_string_literal: true

require 'optparse'
require 'cybertron/options'
require 'cybertron/version'
require 'thor'
require 'fileutils'

module Cybertron
  # CLI class
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path('../templates', __dir__)
    end

    desc ' new <project-name>', 'Create a new Codemod project'
    def new(name)
      puts "Creating new project: #{name}"
      FileUtils.mkdir_p "#{name}/transforms"
      FileUtils.mkdir_p "#{name}/spec"
      template 'rspec.tt', "#{name}/.rspec"
      template 'spec_helper.tt', "#{name}/spec/spec_helper.rb"
      template 'Rakefile.tt', "#{name}/Rakefile"
      template 'readme.tt', "#{name}/README.md"
    end

    desc ' generate <name-of-transform>', 'Generate a new transform'
    def generate(name)
      @name = name
      puts "Creating new transform: #{name}"
      FileUtils.mkdir_p "transforms/#{name}"
      FileUtils.mkdir_p "transforms/#{name}/fixtures"
      template 'transform.tt', "transforms/#{name}/transform.rb"
      template 'transform_spec.tt', "spec/#{name}_spec.rb"
      template 'fixture_input.tt', "transforms/#{name}/fixtures/basic_input.rb"
      template 'fixture_output.tt', "transforms/#{name}/fixtures/basic_output.rb"
      template 'readme_transform.tt', "transforms/#{name}/README.md"
    end
  end
end
