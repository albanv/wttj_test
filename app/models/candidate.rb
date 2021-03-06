class Candidate < ActiveRecord::Base
  belongs_to :job, required: true

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :headline, presence: true
  validates :coverletter, presence: true
  validates :resume, presence: true
end
