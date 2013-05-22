#!/usr/bin/env ruby

require "./lib/parser"

unless ARGV.first
  puts "Use: parse [file names | file glob expression]"
  exit 1
end

Parser.new(ARGV).parse.each {|u| u.each{|k,v| puts "#{k.capitalize}: #{v}"}; puts }
