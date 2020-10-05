class ConnectorsController < ApplicationController
  def index
    @connectors = Connector.all
  end
end
