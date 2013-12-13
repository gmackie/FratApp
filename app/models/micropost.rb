class Micropost < ActiveRecord::Base
  belongs_to :user    # foreign key - user_id
  belongs_to :group   # foreign key - group_id
  has_many :comments, dependent: :destroy
  default_scope -> { order('updated_at DESC') }
  validates :content, presence: true
  validates :user_id, presence: true
  
  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
