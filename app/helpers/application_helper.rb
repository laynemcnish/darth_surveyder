module ApplicationHelper
  def navbar_brand_path
    current_page?(controller: 'surveys', action: 'index') ? "/about" : "/"
  end

  def grouped_categories_for_user(user)
    user_categories = Category.where(id: user.surveys.pluck(:category_id))
    other_categories = Category.where.not(id: user_categories.pluck(:id))
    [
      ["Your categories", user_categories.pluck(:name)],
      ["Other categories", other_categories.pluck(:name)]
    ]
  end
end
