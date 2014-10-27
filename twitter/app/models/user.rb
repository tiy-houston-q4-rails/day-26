class User < ActiveRecord::Base

  has_many :tweets
  has_many :followings
  has_many :followees, through: :followings, class_name: "User"

  def timeline_ids
    followees.pluck(:id) << id
  end

  def timeline
    Tweet.where(user_id: timeline_ids)
  end

  def follow(other_user)
    followings.create! user_id: id, followee_id: other_user.id
  end

end
