def process_ingredients_string(ingredients)

  #split string on ',' and strip out leading and trailing blanks
  return ingredients.split(',').each { |ingredient| ingredient.strip! }

end
