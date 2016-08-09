class Post < ActiveRecord::Base
	before_save :update_slug
	belongs_to :user
	has_many :comments, dependent: :destroy
	acts_as_votable
	validates :title, presence: true, length: {minimum: 5}
	validates :body,  presence: true
	def update_slug
		self.slug=title.parameterize
	end
	def to_param
		slug
	end
end
