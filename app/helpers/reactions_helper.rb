module ReactionsHelper

  def get_product_ids(product_reactions)
    return product_reactions.pluck(:product_id).uniq
  end

  def get_allergen_categories(product_reactions)   
    return product_reactions.pluck(:allergen_id).uniq.map do |allergen_id| 
      Allergen.find(allergen_id).category
    end.join(",\n")
  end

  def get_reactive_ingredients(product_reactions)
    reactive_ingredients = product_reactions.pluck(:reactive_ingredient).uniq.map do |ingredient|
      ingredient.downcase.capitalize
    end.join(", ")
  end

  def get_reactive_substances(product_reactions)
    return product_reactions.pluck(:reactive_substances).uniq.map do |substance|
      substance.gsub(/ ;/,',  ')
    end.join(',  ')
  end

end