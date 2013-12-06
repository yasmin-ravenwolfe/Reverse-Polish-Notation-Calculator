require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'rspec/mocks/standalone'
require_relative '../lib/commandline'

describe CommandLine  do 
  let(:command_line){CommandLine.new}
  let(:input) {StringIO.new("1 2 +")}
before(:each) do
 input = StringIO.new("1 2 +")
end

  describe "#run" do 

    context "when the user input is 'q'" do 
      it "exits the program" do
    # CommandLine.stub(:prompt_user).and_return('q')
    command_line.run
     expect(SystemExit).to eq(false)
      end
    end

    context "when the input is not 'q' valid" do 
      it "returns the correctly calculated result and #prompt_user is rerun" do
        # command_line.prompt_user
    # CommandLine.stub(:prompt_user).and_return('1 2 +')
        
    input = '1 2 +'
        # expect(command_line.prompt_user).to eq(3.0)
      end
    end 

  end


end