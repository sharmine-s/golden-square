require 'gratitudes'

RSpec.describe Gratitudes do
  it "adds a list of gratitudes then lists all of them in a sentence" do
    gratitudes = Gratitudes.new
    gratitudes.add("having a shelter")
    gratitudes.add("access to clean water")
    gratitudes.add("and a good life")
    result = gratitudes.format
    expect(result).to eq "Be grateful for: having a shelter, access to clean water, and a good life"
  end
end