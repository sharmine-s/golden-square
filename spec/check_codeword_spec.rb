require 'check_codeword'

RSpec.describe "check_codeword method" do
    it "checks whether the enter codeword is wrong, close, or correct" do
        result = check_codeword("horse")
        expect(result).to eq "Correct! Come in."
    end
end