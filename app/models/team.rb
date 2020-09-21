class Team < ApplicationRecord
  has_many :team_users
  has_many :team_documents
end
