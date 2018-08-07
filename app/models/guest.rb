class Guest < ApplicationRecord
  has_many :reservations
  has_many :rooms, through: :reservations

  enum loyalty_membership: {standar: 0, silver: 1, gold: 2}
  
  DISCOUNT = { 
    'standar' => 0, 
    'silver' => 0.1,
    'gold' => 0.3
  }.freeze


  def discount_member total
    DISCOUNT[loyalty_membership] * total
  end
end
