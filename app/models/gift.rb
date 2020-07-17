class Gift < ApplicationRecord
  belongs_to :event, required: false
  belongs_to :contact, required: false
end
