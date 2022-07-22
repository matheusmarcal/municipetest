class SendSms
  def initialize(options = {})
    @message = options.fetch(:message)
    @phone = options.fetch(:phone).to_s.delete("^0-9")
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
    from: Figaro.env.twilio_phone_number,
      to: "+#{@phone}",
      body: @message
    })
  end
end
