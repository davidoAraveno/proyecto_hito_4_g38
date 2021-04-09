class Invited < ApplicationRecord
    
    has_many :marriage_inviteds
    has_many :marriages, through: :marriage_inviteds

    def self.marriage(id)
        MarriageInvited.where(marriage_id: id)
    end

end
