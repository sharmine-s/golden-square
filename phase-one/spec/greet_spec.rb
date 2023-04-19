require 'greet'

RSpec.describe "greet method" do
    it "greets the user with the name passed to say Hello" do
        result = greet("Sharmine")
        expect(result).to eq "Hello, Sharmine!"
    end
end