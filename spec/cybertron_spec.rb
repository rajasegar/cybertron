require 'cybertron/cli'

RSpec.describe Cybertron do

  before do
    FileUtils.rm_rf('/tmp/codemod')
  end

  it "has a version number" do
    expect(Cybertron::VERSION).not_to be nil
  end

  it "does create new codemod" do
    cli = Cybertron::CLI.new
    Dir.chdir('/tmp') do
      cli.new 'codemod'
      expect(File.directory?('/tmp/codemod/spec')).to be true
      expect(File.directory?('/tmp/codemod/transforms')).to be true
      expect(File.exist?('/tmp/codemod/README.md')).to be true
      expect(File.exist?('/tmp/codemod/Rakefile')).to be true
      expect(File.exist?('/tmp/codemod/.rspec')).to be true
      expect(File.exist?('/tmp/codemod/spec/spec_helper.rb')).to be true
    end
  end

end
