require 'report_length'

RSpec.describe "report_length method" do
    it "returns how long the string entered is" do
        result = report_length("Hello World!")
        expect(result).to eq "This string was 12 characters long."
    end

    it "returns how long the string entered is" do
        result = report_length("Hi")
        expect(result).to eq "This string was 2 characters long."
    end
end