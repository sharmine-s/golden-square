require 'counter'

RSpec.describe Counter do
  it "counts running total when adding a number" do
    counter = Counter.new
    counter.add(5)
    result = counter.report
    expect(result).to eq "Counted to 5 so far."
  end

  it "counts running total when adding several numbers" do
    counter = Counter.new
    counter.add(3)
    counter.add(6)
    result = counter.report
    expect(result).to eq "Counted to 9 so far."
  end
end