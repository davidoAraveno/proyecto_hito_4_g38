class Marriage < ApplicationRecord
    has_many :marriage_inviteds
    has_many :inviteds, through: :marriage_inviteds
end
