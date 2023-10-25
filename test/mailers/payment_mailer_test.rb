# frozen_string_literal: true

require 'test_helper'

class PaymentMailerTest < ActionMailer::TestCase
  test 'payment_created' do
    mail = PaymentMailer.payment_created
    assert_equal 'Payment created', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
