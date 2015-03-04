class Pledge < ActiveRecord::Base
  belongs_to :funding_level

  validates :funding_level, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :amount, presence: true, numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0
            }

  before_save :set_amount


  def try_to_set_funding_level(funding_levels)
    return if amount.nil? || amount == 0

    self.funding_level = funding_levels
                          .where(['amount <= ?', amount])
                          .order('amount DESC').first
  end

  private

  def set_amount
    if amount.nil? || amount == 0
      self.amount = funding_level.amount
    end
  end
end
