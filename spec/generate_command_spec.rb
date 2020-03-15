require 'cybertron/cli'
require 'cybertron/generate_command'

RSpec.describe 'Generate' do

  before do
    FileUtils.rm_rf('/tmp/codemod')
    Dir.chdir('/tmp') do
      cli = Cybertron::CLI.new
      cli.new 'codemod'
    end
  end

  it 'does generate transform' do
    generate = Cybertron::Generate.new
    Dir.chdir('/tmp/codemod') do
      generate.transform 'sample'
      expect(File.directory?('/tmp/codemod/transforms/sample')).to be true
      expect(File.directory?('/tmp/codemod/transforms/sample/fixtures')).to be true
      expect(File.exist?('/tmp/codemod/transforms/sample/transform.rb')).to be true
      expect(File.exist?('/tmp/codemod/transforms/sample/README.md')).to be true
      expect(File.exist?('/tmp/codemod/transforms/sample/fixtures/basic_input.rb')).to be true
      expect(File.exist?('/tmp/codemod/transforms/sample/fixtures/basic_output.rb')).to be true
      expect(File.exist?('/tmp/codemod/spec/sample_spec.rb')).to be true
    end
  end

  it "does generate fixture" do
    generate = Cybertron::Generate.new
    Dir.chdir('/tmp/codemod') do
      generate.transform 'sample'
      generate.fixture 'sample', 'advanced'
      expect(File.exist?('/tmp/codemod/transforms/sample/fixtures/advanced_input.rb')).to be true
      expect(File.exist?('/tmp/codemod/transforms/sample/fixtures/advanced_output.rb')).to be true
    end
  end
end
