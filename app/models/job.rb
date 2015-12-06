class Job < ActiveRecord::Base
  has_many :candidates

  validates :title, presence: true
  validates :description, presence: true
end
