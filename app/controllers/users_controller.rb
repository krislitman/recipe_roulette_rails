# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  include Loggable

  def edit
    @user = current_user
    @address = @user.current_address
  end

  def update
    current_user.current_address.update(address_params)

    flash[:notice] = "Preferences updated successfully"

    redirect_to edit_user_path
  rescue
    log_edit_user_address(current_user)
    flash[:error] = "Unable to update preferences"

    render :edit
  end

  private

  def address_params
    params.require(:user).permit(:first_name, :last_name, :line1, :line2, :city, :state, :postal_code, :country, :currency)
  end
end
