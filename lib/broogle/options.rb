module Broogle
  class Options
    DEFAULTS = {
      columns: [],
      behaviors: ["::Broogle::Behaviors::Highlighter", "::Broogle::Behaviors::AutoIndexer"],
      orderer: "::Broogle::Orderers::DumbOrderer",
      ranker: "::Broogle::Rankers::DumbRanker",
      splitter: "::Broogle::Splitters::DumbSplitter",
      stemmer: "::Broogle::Stemmers::DumbStemmer",
      stop_words: %w(or and)
    }.freeze

    attr_reader :options

    def initialize(options)
      @options = merge_with_defaults(options)
    end

    def stemmer
      @stemmer ||= options[:stemmer].constantize
    end

    def splitter
      @splitter ||= options[:splitter].constantize
    end

    def orderer
      @orderer ||= options[:orderer].constantize
    end

    def ranker
      @ranker ||= options[:ranker].constantize
    end

    def behaviors
      @behaviors ||= options[:behaviors].map(&:constantize)
    end

    def columns
      options[:columns]
    end

    def stop_words
      options[:stop_words]
    end

    private

    def merge_with_defaults(options)
      DEFAULTS.with_indifferent_access.merge options
    end
  end
end
