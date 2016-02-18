module Broogle
  class QueryBuilder
    include Concerns::Options

    attr_reader :query_string
    attr_reader :scope
    attr_reader :options

    def initialize(scope, query_string, options)
      @scope = scope
      @query_string = query_string
      @options = merge_with_defaults(options)
    end

    def build
      return scope.none if query_string.blank?

      query = scope
      query = apply_query_string(query)
      query
    end

    private

    def apply_query_string(query)
      terms = splitter.new(query_string).split
      terms = terms.flat_map { |term| stemmer.new(term).stem }.uniq
      terms = terms - Array(stop_words)
      query
        .select("#{scope.table_name}.*, ARRAY_AGG(broogle_stems.matched_string) AS highlights")
        .group("#{scope.table_name}.id")
        .joins(:broogle_stems)
        .where("broogle_stems.column" => columns, "broogle_stems.content" => terms)
    end
  end
end
