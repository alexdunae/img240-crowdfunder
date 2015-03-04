class FundingLevel < ActiveRecord::Base
  belongs_to :project
  has_many :pledges, dependent: :nullify

  validates :project, presence: true
  validates :reward_name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }
end
