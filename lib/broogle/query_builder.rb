module Broogle
  class QueryBuilder
    attr_reader :query_string
    attr_reader :scope
    attr_reader :options

    delegate :table_name, to: :scope

    def initialize(scope, query_string, options)
      @scope = scope
      @query_string = query_string
      @options = Options.new(options)
    end

    def build
      return scope.none if query_string.blank?

      query = scope
      query = apply_query_string(query)
      query
    end

    private

    def apply_query_string(query)
      terms = options.splitter.new(query_string).split
      terms = terms.flat_map { |term| options.stemmer.new(term).stem }.uniq
      terms -= Array(options.stop_words)
      query
        .select("#{table_name}.*, ARRAY_AGG(broogle_stems.matched_string) AS highlights")
        .group("#{table_name}.id")
        .joins(:broogle_stems)
        .where("broogle_stems.column" => options.columns, "broogle_stems.content" => terms)
    end
  end
end
