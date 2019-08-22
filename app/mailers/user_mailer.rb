class UserMailer < ActionMailer::Base
  default from: "OA <welcome@oa.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "Earn: Lorem ipsum dolor sit amet, consectetur adipiscing elit."

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
