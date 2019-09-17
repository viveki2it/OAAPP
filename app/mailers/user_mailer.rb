class UserMailer < ActionMailer::Base
  default from: "OA <welcome@oa.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "Natural, Moisturizing, and Hydrating products to leave you feeling rejuvenated and refreshed."

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
