class Job < ActiveRecord::Base
  has_many :candidates
end
