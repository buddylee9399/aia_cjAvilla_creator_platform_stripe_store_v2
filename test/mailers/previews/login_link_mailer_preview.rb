# Preview all emails at http://localhost:3000/rails/mailers/login_link_mailer
class LoginLinkMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/login_link_mailer/send_link
  def send_link
    LoginLinkMailer.send_link
  end

end
