module Broogle
  module Behaviors
    module Highlighter
      extend ActiveSupport::Concern

      class QueryPatch
        attr_reader :query

        def initialize(query)
          @query = query
        end

        def patched_query
          query.select("#{query.table_name}.*, ARRAY_AGG(broogle_stems.matched_string) AS highlights")
        end
      end
    end
  end
end
