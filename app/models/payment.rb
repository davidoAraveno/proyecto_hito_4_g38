class Payment < ApplicationRecord
  belongs_to :reservation
  belongs_to :payment_method
end
