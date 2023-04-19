require 'check_codeword'

RSpec.describe "check_codeword method" do
    it "checks whether the enter codeword is correct" do
        result = check_codeword("horse")
        expect(result).to eq "Correct! Come in."
    end

    it "checks whether the enter codeword is close" do
        result = check_codeword("hope")
        expect(result).to eq "Close, but nope."
    end

    it "checks whether the enter codeword is wrong" do
        result = check_codeword("password")
        expect(result).to eq "WRONG!"
    end
end