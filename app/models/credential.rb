class Credential < ApplicationRecord
  belongs_to :connector
  belongs_to :user
  validates :login, :password, presence: true
end
