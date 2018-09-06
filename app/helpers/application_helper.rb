module ApplicationHelper
  # helpers is where we put presentation level logic used in view templates
  # Rails helpers allow us to consolidate our application's 
  # logic and formatting so we can properly display information
  # in the views. By declaring helper methods within the 
  # {}"application_helper.rb" file, we are able to use the methods in the 
  # views without convoluting the views with logic code.
  
  def sort_link(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end

  def search_all_allergens(search_item, user_id)

    # postgres uses ILIKE, sqlite3 uses LIKE:
    return Allergen.where "user_id = ? AND category ILIKE ? OR substances ILIKE ?", user_id, "%#{search_item}%", "%#{search_item}%"

  end

  def search_all_products(search_item, user_id)

    # postgres uses ILIKE, sqlite3 uses LIKE:
    return Product.where "user_id = ? AND name ILIKE ? OR ingredients ILIKE ?", user_id, "%#{search_item}%", "%#{search_item}%"

  end
  
  def search_all_reactions(search_item, user_id)

    # postgres uses ILIKE, sqlite3 uses LIKE:
    return Reaction.where "user_id = ? AND reactive_ingredient ILIKE ? OR reactive_substances ILIKE ?",user_id, "%#{search_item}%", "%#{search_item}%"

  end
  
end
