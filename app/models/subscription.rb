class Subscription < ActiveRecord::Base
  attr_accessible :name, :email, :address, :city, :zip, :client_id, :paymill_id, :plan_id, :paymill_card_token
  belongs_to :plan
  validates_presence_of :plan_id
  validates_presence_of :email
  
  attr_accessor :paymill_card_token
 

  def save_with_payment
    if valid?
      client = Paymill::Client.create email: email, description: "#{name}, #{address}, #{zip}, #{city}"
      payment = Paymill::Payment.create token: paymill_card_token, client: client.id
      subscription = Paymill::Subscription.create offer: plan.paymill_id, client: client.id, payment: payment.id
      self.paymill_id = subscription.id
      self.client_id = client.id
      save!
  end
  
  rescue Paymill::PaymillError => e
    logger.error "Paymill error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card. Please try again."
    false
  end
  
end
