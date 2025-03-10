class User < ApplicationRecord
  has_secure_password
  has_many :teams
  validates :email, presence: true, uniqueness: true
   # Only allow 'user' or 'admin' as valid roles
   validates :role, inclusion: { in: %w[user coach admin], message: "%{value} is not a valid role" }

   def admin?
     role == 'admin'
   end
 
   def user?
     role == 'user'
   end

   def coach?
     role == 'coach'
   end
end