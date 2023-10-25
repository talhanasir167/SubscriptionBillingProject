# frozen_string_literal: true

require 'test_helper'

class MonthlyMailerTest < ActionMailer::TestCase
  test 'monthly_mailer' do
    mail = MonthlyMailer.monthly_mailer
    assert_equal 'Monthly mailer', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
