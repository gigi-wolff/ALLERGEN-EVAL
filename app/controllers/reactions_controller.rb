class ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_allergen_choices, only: [:create]

# The purpose of the controller is to manage the incoming request and session

  def index
    reactions = Reaction.where("user_id = ?", current_user)
    @reaction_product_ids = reactions.pluck(:product_id).uniq
    render 'reactions/index'
  end

end