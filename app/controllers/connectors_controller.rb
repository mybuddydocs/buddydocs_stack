class ConnectorsController < ApplicationController
  def index
    @connectors = Connector.where(available: true)
  end
end
