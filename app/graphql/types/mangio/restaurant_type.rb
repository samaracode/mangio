module Types
  module Mangio
    class RestaurantType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
    end
  end
end