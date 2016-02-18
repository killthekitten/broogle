module Broogle
  module Concerns
    module Options
      def merge_with_defaults(options)
        DEFAULT_OPTIONS.with_indifferent_access.merge options
      end

      def stemmer
        @stemmer ||= options[:stemmer].constantize
      end

      def splitter
        @splitter ||= options[:splitter].constantize
      end

      def sorter
        @sorter ||= options[:sorter].constantize
      end

      def ranker
        @ranker ||= options[:ranker].constantize
      end

      def columns
        options[:columns]
      end

      def stop_words
        options[:stop_words]
      end
    end
  end
end
