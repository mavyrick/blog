class User < ApplicationRecord

  has_many :products, dependent: :nullify
  has_many :reviews

  has_secure_password

  validates :email, presence: true, uniqueness: true,
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

end
