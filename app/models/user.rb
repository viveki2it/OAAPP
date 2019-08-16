class User < ApplicationRecord
  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id', optional: true
  has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :email, presence: true, :uniqueness => {:message => "Email is already taken"}, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }
  validates :referral_code, uniqueness: true

  before_create :create_referral_code
  after_create :send_welcome_email

  REFERRAL_STEPS = [
    {
      'count' => 5,
      'html1' => '2 Chamber Series Tickets<br/><i>-Summer </i>',
      'class' => 'two',
      'image' =>  ''
    },
    {
      'count' => 20,
      'html1' => '2 POPS SERIES Debut Tickets<br/><i>The Great American Songbook</i><br/><i>-November</i>',
      'class' => 'three',
      'image' =>  ''
    },
    {
      'count' => 40,
      'html1' => '4 MASTERWORKS II Tickets<br/><i>The Dance of Life</i><br/><i>-January</i>',
      'class' => 'four',
      'image' =>  ''
    },
    {
      'count' => 75,
      'html1' => "MASTERWORKS<br/>SERIES<br/>SUBSCRIPTION",
      'class' => 'five',
      'image' =>  ''
    }
  ]
  
  def user_url(root_url)
    root_url + "users/" + referral_code
  end  

  private

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end

  def send_welcome_email
    UserMailer.signup_email(self).deliver_now
  end

end
