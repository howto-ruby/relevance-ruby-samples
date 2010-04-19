#!/usr/bin/env ruby
$LOAD_PATH << File.dirname(__FILE__) + '/lib'
require 'calculator'

c = Calculator.new
c.ui_loop
