require 'securerandom'

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :schoolName, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :create_short_link
  before_destroy :destroy_short_link

  def create_short_link
    Link.create(url: self.slug, shortSlug: random_string)
  end

  def destroy_short_link
    link = Link.where(url: self.slug).first
    link.destroy
  end

  def random_string
    random = SecureRandom.hex
    return random[0, 6]
  end
end
