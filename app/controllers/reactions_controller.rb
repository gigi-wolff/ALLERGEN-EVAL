class ReactionsController < ApplicationController
  before_action :authenticate_user!


# The purpose of the controller is to manage the incoming request and session

  def index
    # reactive_product is an array of ALL product_ids in Reaction db for current user
    @reactive_product = Reaction.where("user_id = ?", current_user).pluck(:product_id).uniq
    render 'reactions/index'
  end

  private

end