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
  belongs_to(:board)
  scope :expired, -> { where(is_expired: true) }

  def is_expired
    return self.expires_on < Date.today
  end
end
