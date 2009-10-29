#!/usr/bin/env ruby
require 'find'
require 'rubygems'
require 'activesupport'

total_size = 0

Find.find(*ARGV) do |path|
  stat = File.lstat(path)
  next if stat.directory? || stat.symlink?
  
  if  stat.mtime < 1.year.ago &&
      stat.atime < (stat.mtime + 3.weeks) &&
      stat.size >= 3.megabytes
    puts "#{path}, #{stat.size}"
  end
end
