class MarriageInvited < ApplicationRecord
  belongs_to :marriage
  belongs_to :invited
end
