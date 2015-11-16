class User < ActiveRecord::Base
  # User Authentication
  ## Include default devise modules. Others available are:
  ## :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

end
