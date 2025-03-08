# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [ Types::NodeType, null: true ], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ ID ], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    # Restaurants
    # Get all
    field :restaurants, [ Types::Mangio::RestaurantType ], null: false, description: "Returns a list of restaurants"

    def restaurants
      Restaurant.all
    end

    # Get by id
    field :restaurant, Types::Mangio::RestaurantType, null: false, description: "Returns a restaurant by id" do
      argument :id, ID, required: true, description: "ID of the restaurant."
    end

    def restaurant(id:)
      Restaurant.find(id)
    end
  end
end
