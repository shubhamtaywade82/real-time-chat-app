class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :username

  has_many :messages, dependent: :destroy

  after_create_commit { broadcast_append_to 'users' }

  scope :all_except, ->(user) { where.not(id: user) }
end
