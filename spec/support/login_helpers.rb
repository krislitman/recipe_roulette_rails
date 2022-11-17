# frozen_string_literal: true

module LoginHelpers
  def login(type)
    if type == :user
      create_user
      login_user
    end
  end

  def create_user
    FactoryBot.create :user
  end

  def login_user
    user = User.last

    sign_in user
  end
end
