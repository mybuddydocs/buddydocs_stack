class ConnectorsController < ApplicationController
  def index
    @connectors = Connector.all

    # je fais un test
  end
end
