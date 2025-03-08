module Mutations
  module Mangio
    class CreateRestaurant < BaseMutation
      argument :name, String, required: true

      field :restaurant, Types::Mangio::RestaurantType, null: false

      def resolve(name:)
        restaurant = Restaurant.find_or_create_by!(name: name)
        { restaurant: restaurant }
      end
    end
  end
end
