require 'json'

class Parser
  def initialize(files)
    @files = files
  end

  def parse
    info_for_users = []
    files.each do |file_name|
      json = read(file_name)
      next unless json

      user_info = parse_json(json)
      next unless user_info

      email = user_info['email']
      next unless valid_email?(email)

      name = user_info['name']
      company = user_info['company']
      info_for_users << {'name' => name,
                         'company' => company,
                         'email' => email}

    end
    info_for_users
  end


  private

  def read(file_name)
    if File.exists?(file_name)
      File.read(file_name)
    else
      nil
    end
  end

  def parse_json(json)
    begin
      user_info = JSON.parse(json)
    rescue JSON::ParserError
      nil
    end
  end

  def valid_email?(email)
    email =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  end

  attr_reader :files
end
