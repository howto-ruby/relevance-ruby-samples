require 'rubygems'
require 'spec'
require 'spec/autorun'

root_dir = File.expand_path(File.dirname(__FILE__) + '/..')
$LOAD_PATH.unshift(root_dir + '/spec')
$LOAD_PATH.unshift(root_dir + '/lib')

Dir.glob("#{root_dir}/lib/**/*.rb") do |fn|
  require fn unless fn =~ %r{/(test|spec)/}
end

Spec::Runner.options.colour = true
Spec::Runner.configure do |config|
  config.mock_with :mocha
end
