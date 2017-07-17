class Comment < ApplicationRecord
  validates :content, presence: true
  validates :job, presence: true
  belongs_to :job
end
