require 'rspec'
require_relative '../lib/parser'

describe Parser do
  describe '#parse' do
    it "returns an array of the user info" do
      file = File.join(File.dirname(__FILE__),'good.json')
      parser = Parser.new([file])
      parser.parse.should == ["Name: Ryan McGarvey\nCompany: Gust\nEmail: ryan@gust.com"]
    end

    it "does not include bad json" do
      file = File.join(File.dirname(__FILE__),'bad_json.json')
      parser = Parser.new([file])
      parser.parse.should == []
    end

    it "rejects if email is invalid" do
      file = File.join(File.dirname(__FILE__), 'bad_email.json')
      parser = Parser.new([file])
      parser.parse.should == []
    end
  end
end
