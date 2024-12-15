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
  validates(:body, { :presence => true })
  belongs_to(:board)
  scope :expired, -> { where('expires_on < ?', Date.today).order(expires_on: :desc) }
  scope :active, -> { where('expires_on >= ?', Date.today).order(expires_on: :asc) }
end
