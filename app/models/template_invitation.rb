class TemplateInvitation < ApplicationRecord
  belongs_to :marriage, optional: true
end
