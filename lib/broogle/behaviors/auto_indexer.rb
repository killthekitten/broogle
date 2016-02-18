module Broogle
  module Behaviors
    module AutoIndexer
      extend ActiveSupport::Concern

      included do
        after_save :update_broogle_terms!
      end
    end
  end
end
