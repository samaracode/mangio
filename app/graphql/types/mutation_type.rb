# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Restaurants
    field :create_restaurant, mutation: Mutations::Mangio::CreateRestaurant
    field :update_restaurant, mutation: Mutations::Mangio::UpdateRestaurant
  end
end
