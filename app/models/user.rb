class User < ActiveRecord::Base
  #User Authentication
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #User communication
  acts_as_followable
  acts_as_follower
end
