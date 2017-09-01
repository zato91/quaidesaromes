class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :confirm_within => 3.days
  devise :omniauthable, omniauth_providers: [:facebook]


  has_many :game_users, dependent: :destroy
  has_many :game_user_sessions, dependent: :destroy
  has_attachment :photo
  has_many :games, through: :game_users

  def self.allow_unconfirmed_access_for
    3.days # Or any time frame you like
  end

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end
  protected
    def confirmation_required?
      true
    end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  # Setup accessible (or protected) attributes for your model
  # attr_accessor :email, :password, :password_confirmation

end
