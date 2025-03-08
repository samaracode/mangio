module Mutations
  module Mangio
    class UpdateRestaurant < BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true

      field :restaurant, Types::Mangio::RestaurantType, null: false

      def resolve(id:, name:)
        restaurant = Restaurant.find(id)
        restaurant.update(name: name)
        {
          restaurant: restaurant
        }
      end
    end
  end
end