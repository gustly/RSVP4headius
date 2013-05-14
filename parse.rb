require "rubygems"
require "json"

files = Dir.glob("*.json")

files.each do |file_name|
  file = open(file_name)
  json = file.read

  parsed = JSON.parse(json)

  if parsed.keys != ["company", "name", "email"]
    p "Wrong format in #{file_name}"
    next
  end

  unless parsed["email"] =~ /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
    p "Wrong email format"
    next
  end

  parsed.each do |key, value|
    p "#{key} : #{value}"
  end
end
