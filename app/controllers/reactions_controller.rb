class ReactionsController < ApplicationController
  before_action :authenticate_user!


# The purpose of the controller is to manage the incoming request and session

  def index
    @reactions = Reaction.where("user_id = ?", current_user)
    render 'reactions/index'
  end

  private

end