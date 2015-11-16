class User < ActiveRecord::Base
  # Data Validations
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
  }

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  # User Authentication
  ## Include default devise modules. Others available are:
  ## :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Use username for login with devise
  attr_accessor :login


  def self.find_for_database_authentication(warden_conditions)
     conditions = warden_conditions.dup
     if login = conditions.delete(:login)
       where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
     else
       where(conditions.to_h).first
     end
   end

  # User communication
  acts_as_followable
  acts_as_follower

  # User data

  ##Avatar
  has_attached_file :avatar, styles: {medium: "400x300>", square: "250x250#", thumb: "100x100>", small_thumb:"30x30#" }, default_url: "avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  ##Cover
  has_attached_file :cover, styles: { very_large:"1600x1200>", large:"1280x1024>", medium: "800x600>", small: "600x400>", very_small: "400x200>" }, default_url: "cover.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  ##Friendly id
  extend FriendlyId
  friendly_id :username, use: :slugged

  ##Searchkick
  searchkick

  ##User posts
  has_many :posts

  ##Like posts
  acts_as_voter

end
