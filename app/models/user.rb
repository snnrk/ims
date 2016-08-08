class User < ActiveRecord::Base
  validates :displayname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-\.]+@[a-z\d\-\.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :written_issues, class_name: "Issue", foreign_key: :author_id
  #has_many :assigned_issues, class_name: "Issue", foreign_key: :assigned_id
end
