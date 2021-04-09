class TemplateInvitation < ApplicationRecord
  belongs_to :marriage, optional: true

  def self.active_invitation(id)
    TemplateInvitation.find_by(marriage_id: id)
  end
end
