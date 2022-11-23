module Loggable
  extend ActiveSupport::Concern

  def log_create_recipe(success, user = nil, recipe = nil)
    if success.present?
      Rails.logger.info "Created recipe with recipe_id=#{recipe.id}"
    else
      Rails.logger.error "Unable to create recipe for user=#{user.id}"
    end
  end

  def log_create_user_recipe(success, user = nil, recipe = nil)
    if success.present?
      Rails.logger.info "Created user_recipe with user_id=#{user.id}, recipe_id=#{recipe.id}"
    else
      Rails.logger.error "Unable to create user_recipe for user=#{user.id}"
    end
  end

  def log_destroy_user_recipe(success, user = nil, recipe = nil)
    if success.present?
      Rails.logger.info "Destroyed user_recipe with user_id=#{user.id}, recipe_id=#{recipe.id}"
    else
      Rails.logger.error "Unable to destroy user_recipe for user=#{user.id}"
    end
  end

  def log_edit_user_address(user)
    Rails.logger.error "Unable to update user address for user=#{user.id}"
  end
end