class Marriage < ApplicationRecord
    has_many :marriage_inviteds
    has_many :inviteds, through: :marriage_inviteds
    has_one :ceremony
    has_one :celebration
    has_one :template_invitation
end
