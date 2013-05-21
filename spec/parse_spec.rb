require 'rspec'
require './lib/parser'

describe Parser do
  describe '#parse' do
    let(:file) { File.join(File.dirname(__FILE__), file_name) }
    let(:parser) { Parser.new([file]) }
    subject { parser.parse }

    context "when the file contains valid data" do
      let(:file_name) {"good.json"}
      it { should == [{'name' => 'Ryan McGarvey', 'company' => 'Gust', 'email' => 'ryan@gust.com'} ] }
    end

    context "when the file contains bad json" do
      let(:file_name) {"bad_json.json"}
      it { should == [] }
    end

    context "when the file contains an invalid email" do
      let(:file_name) {"bad_email.json"}
      it { should == [] }
    end

    context "when the file does not exist" do
      let(:file_name) {"bad_file.json"}
      it { should == [] }
    end
  end
end
