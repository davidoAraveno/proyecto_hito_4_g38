class Invited < ApplicationRecord
    
    has_many :marriage_inviteds, dependent: :destroy
    has_many :marriages, through: :marriage_inviteds

    def self.marriage(id)
        MarriageInvited.where(marriage_id: id)
    end

end
