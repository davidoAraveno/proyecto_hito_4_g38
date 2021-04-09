class Invited < ApplicationRecord
    
    has_many :marriage_inviteds
    has_many :marriages, through: :marriage_inviteds
end
