module Broogle
  DEFAULT_OPTIONS = {
    columns: [],
    behaviors: ["::Broogle::Behaviors::Highlighter", "::Broogle::Behaviors::AutoIndexer"],
    sorter: "::Broogle::Sorters::DumbSorter",
    ranker: "::Broogle::Rankers::DumbRanker",
    splitter: "::Broogle::Splitters::DumbSplitter",
    stemmer: "::Broogle::Stemmers::DumbStemmer",
    stop_words: %w(or and)
  }

  extend ActiveSupport::Concern

  included do
    has_many :broogle_stems, as: :document, dependent: :delete_all
  end

  module ClassMethods
    def enable_search(options)
      define_singleton_method(:search) do |query_string|
        QueryBuilder.new(self, query_string, options).build
      end

      define_method(:update_broogle_terms!) do
        Indexer.new(self, options).index
      end

      BehaviorMixer.new(self, options).mix
    end
  end
end
