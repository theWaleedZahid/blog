class User < ActiveRecord::Base
  before_save :update_slug
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  def update_slug
	  self.slug="@"+username.parameterize
	end
	
	def to_param
		slug
	end
end
