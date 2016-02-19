class FamousQuote < ActiveRecord::Base
  include Broogle

  validates :content, presence: true

  enable_search columns: [:author, :content]
end
