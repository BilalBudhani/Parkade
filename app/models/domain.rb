class Domain < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :status
end
