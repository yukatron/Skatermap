class Skater < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :parks
  has_many :countries
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :skater

  def follow(skater)
    unless self == skater
      self.relationships.find_or_create_by(follow_id: skater.id)
    end
  end

  def unfollow(skater)
    relationship = self.relationships.find_by(follow_id: skater.id)
    relationship.destroy if relationship
  end

  def following?(skater)
    self.followings.include?(skater)
  end

  validates :name, presence: true, uniqueness: true
  validates :is_deleted, default: false
  validates :email, presence: true

  attachment :profile_image

end
