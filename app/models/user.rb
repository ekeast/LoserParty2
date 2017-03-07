class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :invites, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
