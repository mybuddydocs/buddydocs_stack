class CredentialsController < ApplicationController

  def index
    @credentials = Credential.where(user: current_user)
  end

  def new
    @credential = Credential.new
    @connectors = Connector.all
  end

  def create
    @credential = Credential.new(params_credentials)
    @credential.user = current_user
    @credential.save
    # if !@credential.save then render: new end
  end

  private

  def params_credentials
    params.require(:credential).permit(:connector_id, :login, :password)
  end
end
