module ReactionsHelper
  def get_allergen_categories(product)   
    return product.pluck(:allergen_id).uniq.map do |allergen_id| 
      Allergen.find(allergen_id).category
    end.join(",\n")
  end

  def get_reactive_ingredients(product)
    reactive_ingredients = product.pluck(:reactive_ingredient).uniq.map do |ingredient|
      ingredient.downcase.capitalize
    end.join(", ")
  end

  def get_reactive_substances(product)
    return product.pluck(:reactive_substances).uniq.map do |substance|
      substance.gsub(/ ;/,',  ')
    end.join(',  ')
  end
end