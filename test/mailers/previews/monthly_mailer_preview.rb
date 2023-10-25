# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/monthly_mailer
class MonthlyMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/monthly_mailer/monthly_mailer
  def monthly_mailer
    MonthlyMailer.monthly_mailer
  end
end
