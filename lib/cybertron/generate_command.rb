# frozen_string_literal: true

require 'thor'
require 'fileutils'

module Cybertron
  # CLI class
  class Generate < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path('../templates', __dir__)
    end

    def self.banner(command, namespace = nil, subcommand = false)
      "#{basename} #{subcommand_prefix} #{command.usage}"
    end

    def self.subcommand_prefix
      self.name.gsub(%r{.*::}, '').gsub(%r{^[A-Z]}) { |match| match[0].downcase }.gsub(%r{[A-Z]}) { |match| "-#{match[0].downcase}" }
    end

    desc 'transform <transform-name>', 'Generate a new transform'
    def transform(name)
      @name = name
      puts "Creating new transform: #{name}"
      FileUtils.mkdir_p "transforms/#{name}"
      FileUtils.mkdir_p "transforms/#{name}/fixtures"
      template 'transforms/transform.tt', File.absolute_path("transforms/#{name}/transform.rb")
      template 'transforms/spec.tt', File.absolute_path("spec/#{name}_spec.rb")
      template 'transforms/fixture_input.tt', File.absolute_path("transforms/#{name}/fixtures/basic_input.rb")
      template 'transforms/fixture_output.tt', File.absolute_path("transforms/#{name}/fixtures/basic_output.rb")
      template 'transforms/README.tt', File.absolute_path("transforms/#{name}/README.md")
    end

    desc 'fixture <transform-name> <fixture-name>', 'Generate a new fixture for a transform'
    def fixture(codemod, name)
      @codemod = codemod
      @name = name
      puts "Creating new fixture: #{name} for #{codemod}"
      template 'transforms/fixture_input.tt', File.absolute_path("transforms/#{codemod}/fixtures/#{name}_input.rb")
      template 'transforms/fixture_output.tt', File.absolute_path("transforms/#{codemod}/fixtures/#{name}_output.rb")
    end


  end
end
