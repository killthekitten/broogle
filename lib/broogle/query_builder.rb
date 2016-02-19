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
      query = apply_ranking(query)
      query = apply_ordering(query)
      query = apply_behaviors(query)
      query
    end

    private

    def apply_query_string(query)
      terms = options.splitter.new(query_string).split
      terms = terms.flat_map { |term| options.stemmer.new(term).stem }.uniq
      terms -= Array(options.stop_words)
      query
        .group("#{table_name}.id")
        .joins(:broogle_stems)
        .where("broogle_stems.column" => options.columns, "broogle_stems.content" => terms)
    end

    def apply_ranking(query)
      options.ranker.new(query).ranked_query
    end

    def apply_ordering(query)
      options.orderer.new(query).ordered_query
    end

    def apply_behaviors(query)
      patched_query = query
      options.behaviors.each do |behavior|
        klass = "#{behavior}::QueryPatch".safe_constantize
        patched_query = klass.new(query).patched_query if klass.is_a?(Class)
      end
      patched_query
    end
  end
end
