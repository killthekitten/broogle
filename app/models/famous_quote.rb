class FamousQuote < ActiveRecord::Base
  include Broogle

  enable_search columns: [:author, :content]
end
