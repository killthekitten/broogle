module Broogle
  class Indexer
    attr_reader :document
    attr_reader :options

    def initialize(document, options)
      @document = document
      @options = Options.new options
    end

    def index
      ActiveRecord::Base.transaction do
        BroogleStem.where(document: document).delete_all
        options.columns.each do |column_name|
          value = document.send(column_name)
          terms = options.splitter.constantize.new(value).split
          terms.each do |term|
            stem = options.stemmer.constantize.new(term).stem
            BroogleStem.create!(document: document, column: column_name, matched_string: term, content: stem)
          end
        end
      end
    end
  end
end
