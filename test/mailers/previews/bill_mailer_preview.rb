# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/bill_mailer
class BillMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/bill_mailer/bill_mailer
  def bill_mailer
    BillMailer.bill_mailer
  end
end
