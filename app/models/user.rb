# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :user_recipes
  has_many :recipes, through: :user_recipes, dependent: :destroy

  after_create_commit :create_user_address

  def name_or_email
    if current_address.first_name.present?
      current_address.first_name
    else
      email
    end
  end

  def current_address
    addresses.order(:created_at).last
  end

  def admin?
    admin == true
  end

  protected

  def create_user_address
    addresses.create!
  end
end
