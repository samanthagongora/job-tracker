class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates :email, presence: true

  belongs_to :company
end
