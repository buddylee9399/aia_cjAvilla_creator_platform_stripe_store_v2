require "test_helper"

class LoginLinkMailerTest < ActionMailer::TestCase
  test "send_link" do
    mail = LoginLinkMailer.send_link
    assert_equal "Send link", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
