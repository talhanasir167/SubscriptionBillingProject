# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/payment_created
  def payment_created
    PaymentMailer.payment_created
  end
end
