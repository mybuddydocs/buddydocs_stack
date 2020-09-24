class Credential < ApplicationRecord
  belongs_to :connector
  belongs_to :user
  validates :login, :password, presence: true

  def launch_connector
    if self.connector.name == "udemy_connector"
      Spiders::SpiderUdemy.parse!(:parse, url: "https://www.udemy.com/dashboard/purchase-history/", data: {login: self.login, pwd: self.password})
    end
  end

end
