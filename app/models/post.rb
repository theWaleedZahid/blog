class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
	belongs_to :user
	has_many :comments, dependent: :destroy
	acts_as_votable
	validates :title, presence: true, length: {minimum: 5}
	validates :body,  presence: true
end
