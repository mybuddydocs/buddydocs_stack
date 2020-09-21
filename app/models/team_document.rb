class TeamDocument < ApplicationRecord
  belongs_to :team
  belongs_to :document
end
