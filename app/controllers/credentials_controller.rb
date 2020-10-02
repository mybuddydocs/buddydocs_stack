class CredentialsController < ApplicationController

  def Index
    @credentials = Credential.where(user: current_user)
  end
end
