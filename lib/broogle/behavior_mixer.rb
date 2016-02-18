module Broogle
  class BehaviorMixer
    include Concerns::Options

    attr_reader :klass
    attr_reader :options

    def initialize(klass, options)
      @klass = klass
      @options = merge_with_defaults options
    end

    def mix
      options[:behaviors].each do |module_name|
        klass.include(module_name.constantize)
      end
    end
  end
end
