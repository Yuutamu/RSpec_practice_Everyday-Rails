# 
class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user_id }

  belongs_to :owner, class_name: 'User', foreign_key: :user_id # owner という名前で参照されている
  has_many :notes, dependent: :destroy
  has_many :tasks, dependent: :destroy

  # コメントアウトp69の段階では必要な浅そう
  attribute :due_on, :date, default: -> { Date.current }
  def late? # RSpec が自動で認識して、late に対して真偽値返してくれる
    due_on.in_time_zone < Date.current.in_time_zone
  end

end
