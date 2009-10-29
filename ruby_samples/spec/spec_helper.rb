require 'rubygems'
require 'spec'

root_dir = File.expand_path(File.dirname(__FILE__) + '/..')
file_pattern = "#{root_dir}/collections/**/*.rb"
Dir.glob(file_pattern) do |fn|
  require fn
end

# codecite shared
Dir.glob("#{root_dir}/spec/shared/*.rb") do |fn|
  require fn
end
# codecite shared

__END__
# codecite user_content
root_dir = File.expand_path(File.dirname(__FILE__) + '/..')
file_pattern = "#{root_dir}/**/*.rb"
Dir.glob(file_pattern) do |fn|
  require fn unless fn =~ %r{/(test|spec)/}
end
# codecite user_content
