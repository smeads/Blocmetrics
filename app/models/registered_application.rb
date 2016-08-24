class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :url, presence: true, uniqueness: { scope: :user_id }
end
