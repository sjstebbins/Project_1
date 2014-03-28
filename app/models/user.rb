class User < ActiveRecord::Base
  has_many(:entries)
  has_secure_password

  validates(:email, uniqueness: true, presence: true)
  validates(:name, presence: true)
  validates(:password, length: { minimum: 5 })

end
