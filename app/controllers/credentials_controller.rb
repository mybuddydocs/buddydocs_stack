class CredentialsController < ApplicationController

  def index
    @credentials = Credential.where(user: current_user)
  end
end
