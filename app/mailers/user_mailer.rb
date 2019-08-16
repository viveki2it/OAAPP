class UserMailer < ActionMailer::Base
  default from: "LTHR <welcome@lthr.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "Earn: Lorem ipsum dolor sit amet, consectetur adipiscing elit."

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
