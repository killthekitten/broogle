class BroogleStem < ActiveRecord::Base
  belongs_to :document, polymorphic: true
end
