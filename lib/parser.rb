require 'json'

class Parser
  attr_accessor :files

  def initialize(files)
    self.files = files
  end

  def parse
    output = files.map do |f|
      info = JSON.parse(File.read(f)) rescue nil
      next unless info && info['email'].match(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
      info
    end
    output.compact
  end
end
