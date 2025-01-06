class User < ApplicationRecord
  after_create :send_welcome_email
  has_many :posts
  validates :full_name, length: { minimum: 5}
  validates :full_name, length: { maximum: 25 }
  validates :full_name, :email, :encrypted_password, uniqueness: true
  validates :full_name, :email, :encrypted_password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         acts_as_followable
         acts_as_follower
         acts_as_liker
         acts_as_mentioner


         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.full_name = auth.info.name
            user.avatar_url= auth.info.image
            end
         end

         private

         def send_welcome_email
          UserMailer.welcome_email(self).deliver_later
         end
end