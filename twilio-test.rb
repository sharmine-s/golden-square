require "twilio-ruby"

# Your Account SID and Auth Token from console.twilio.com
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
  body: "Hello from Ruby",
  to: "+12345678901",  # Text this number
  from: "+15005550006", # From a valid Twilio number
)

puts message.sid