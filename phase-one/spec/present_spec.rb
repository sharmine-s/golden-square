require 'present'

RSpec.describe Present do
  it "wraps a content" do
    present = Present.new
    present.wrap("puzzle")
    result = present.unwrap
    expect(result).to eq "puzzle"
  end

  context "when contents have not been wrapped" do
    it "fails" do
      present = Present.new
      expect { present.unwrap }.to raise_error "No contents have been wrapped."
    end
  end

  context "when a content has already been wrapped" do
    it "fails" do
      present = Present.new
      present.wrap("puzzle")
      expect { present.wrap("toy") }.to raise_error "A contents has already been wrapped."
    end
  end
end