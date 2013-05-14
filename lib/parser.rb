require 'json'

class Parser
  def initialize(files)
    @files = files
  end

  def parse
    info_for_users = []
    @files.each do |file_name|
      file = open(file_name)
      json = file.read

      begin
        user_info = JSON.parse(json)
      rescue JSON::ParserError
        next
      end

      name = user_info['name']
      company = user_info['company']
      email = user_info['email']

      unless email =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
        next
      end

      output_for_user = "Name: #{name}\nCompany: #{company}\nEmail: #{email}"
      info_for_users << output_for_user
    end
    info_for_users
  end
end
