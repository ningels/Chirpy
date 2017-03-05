class Chirp < ApplicationRecord

  belongs_to :user
  validates  :body,    length: { maximum: 160 },
                       allow_blanks: false, uniqueness: true

  def self.timeline(user)
    following_ids = user.followees(User).pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end


end
