class User < ActiveRecord::Base

  has_many :kids,  dependent: :destroy
  has_secure_password
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :admin, :inclusion => {:in => [true, false]}
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :admin, :inclusion => {:in => [true, false]}

  def is_admin?
    self.admin == true
  end

end
