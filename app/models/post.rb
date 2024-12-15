# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text
#  expires_on :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
class Post < ApplicationRecord
  def active_posts
    all_active_posts = Post.where(:expires_on > Time.current)
    return all_active_posts
  end

  def expired_posts
    all_expired_posts = Post.where(:expires_on < Time.current)
    return all_expired_posts
  end
end
