class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :get_allergen_choices, only: [:create]

# The purpose of the controller is to manage the incoming request and session

  def index
    @menu = Menu.all
    render 'menus/index'
  end

  # POST '/menus'
  # the general pattern used in the action create that handles
  # submission of model-backed forms 
  def create 
    # the form displayed in "index.html.erb" is submitted to action='/create' 
    # using verb method="post" which is routed to allergens#create.
    # @allergen, is populated with values (params) submitted from the form
    @my_allergens.each do |allergen|
      @allergen = Allergen.find_or_create_by(category: allergen.category, substances:allergen.substances, user_id:current_user.id)
    end
    flash[:success] = "Allergens successfully created"
    redirect_to allergens_path # allergens/index
  end


  private 

  def get_allergen_choices
    @my_allergens = Menu.where(id: params[:allergen_id])
  end

end