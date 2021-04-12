class Reservation < ApplicationRecord
    validates :name1, presence: true
    validates :name2, presence: true
    validates :email_name1, presence: true
    validates :email_name2, presence: true
    validates :phone_name1, presence: true
    validates :phone_name2, presence: true
    
end