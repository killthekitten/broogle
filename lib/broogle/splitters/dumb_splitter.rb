module Broogle
  module Splitters
    class DumbSplitter
      BREAKERS =
        [" ", "\n", "\t", ".", ",", ";", ":", "\\(", "\\)", "\\[", "\\]", '\'', '"', '\\?', '\\!', "<", ">"].freeze

      def initialize(source)
        @source = source
      end

      def split
        @source.split(regexp_splitter)
      end

      def regexp_splitter
        Regexp.new("[#{BREAKERS.join}]+")
      end
    end
  end
end
