class Project < ActiveRecord::Base
  has_many :funding_levels, dependent: :nullify

  validates :name, :description, presence: true, length: { minimum: 2 }
end
