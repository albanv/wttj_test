class Job < ActiveRecord::Base
  has_many :candidates, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
