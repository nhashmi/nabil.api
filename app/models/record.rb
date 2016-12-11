class Record < ActiveRecord::Base
  belongs_to :user
  validates :date, uniqueness: true
end
