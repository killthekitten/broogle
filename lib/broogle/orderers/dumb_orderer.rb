module Broogle
  module Orderers
    class DumbOrderer
      attr_reader :query

      def initialize(query)
        @query = query
      end

      def ordered_query
        query.reorder("rank DESC")
      end
    end
  end
end
