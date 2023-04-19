require 'string_builder'

RSpec.describe StringBuilder do
  it "returns running total of the length of all entered strings" do
    string = StringBuilder.new
    string.add("Hi")
    result = string.size
    expect(result).to eq(2)
  end

  it "returns all strings put together" do
    string = StringBuilder.new
    string.add("Hello ")
    string.add("World!")
    result = string.output
    expect(result).to eq "Hello World!"
  end
end