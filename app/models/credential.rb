class Credential < ApplicationRecord
  belongs_to :connector
  belongs_to :user
  validates :login, :password, presence: true

  def launch_connector
    if self.connector.name == "udemy_connector"
      Spiders::SpiderUdemy.parse!(:parse, url: self.connector.url, data: {login: self.login, pwd: self.password, user: self.user})
    end
  end

end
