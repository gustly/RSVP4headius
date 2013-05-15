#!/usr/bin/env ruby

require_relative "lib/parser"

unless ARGV.first
  puts "Use: parse [file names | file glob expression]"
  exit 1
end

parser = Parser.new(ARGV)
attendees = parser.parse

attendees.each do |user_info|
  puts "Name: #{user_info['name']}"
  puts "Company: #{user_info['company']}"
  puts "Email: #{user_info['email']}"
  puts
end
