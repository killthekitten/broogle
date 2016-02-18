module Broogle
  module Stemmers
    class DumbStemmer
      def initialize(source)
        @source = source
      end

      def stem
        Stemmer.stem_word(@source.downcase)
      end
    end
  end
end
