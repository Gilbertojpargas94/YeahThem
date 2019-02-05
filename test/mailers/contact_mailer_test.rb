require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "new_contact_one" do
    mail = ContactMailer.new_contact_one
    assert_equal "New contact one", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
