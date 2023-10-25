# frozen_string_literal: true

require 'test_helper'

class BillMailerTest < ActionMailer::TestCase
  test 'bill_mailer' do
    mail = BillMailer.bill_mailer
    assert_equal 'Bill mailer', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
