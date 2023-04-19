require 'password_checker'

RSpec.describe PasswordChecker do
  it "checks that the password is at least 8 characters" do
    password_checker = PasswordChecker.new
    result = password_checker.check("sharmine")
    expect(result).to eq true
  end

  context "when the password isn't long enough" do
    it "fails" do
      password_checker = PasswordChecker.new
      expect { password_checker.check("1234") }.to raise_error "Invalid password, must be 8+ characters."
    end
  end
end