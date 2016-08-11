class User < ActiveRecord::Base
  before_save :update_slug
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_attached_file :avatar, styles: { profile: "300x300>", thumb: "40x40>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    def update_slug
	  self.slug="@"+username.parameterize
	end
	
	def to_param
		slug
	end
end
