module Broogle
  module Rankers
    class DumbRanker
      attr_reader :query

      def initialize(query)
        @query = query
      end

      def ranked_query
        query.select("COUNT(broogle_stems.id) AS rank")
      end
    end
  end
end
