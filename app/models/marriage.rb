class Marriage < ApplicationRecord
    
    has_many :marriage_inviteds, dependent: :destroy
    has_many :inviteds, through: :marriage_inviteds, dependent: :destroy
    has_one :ceremony, dependent: :destroy
    has_one :celebration, dependent: :destroy
    has_one :template_invitation, dependent: :destroy
end
