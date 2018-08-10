def search_all_products(search_item, user_id)
  # LIKE is the SQL standard while ILIKE is a useful extension made by PostgreSQL.
  # use ILIKE in production and LIKE in development
  products = Product.where "user_id = ?", user_id

  #in production:
  #return products.where "name ILIKE ? OR ingredients ILIKE ?", "%#{search_item}%", "%#{search_item}%"
  
  #in development:
  return products.where "name LIKE ? OR ingredients LIKE ?", "%#{search_item}%", "%#{search_item}%"

end