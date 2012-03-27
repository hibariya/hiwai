module Hiwai
  module Masked
    def self.included(klass)
      klass.class_eval do
        alias_method :to_s, :masked_string
        alias_method :inspect, :masked_string
      end
    end

    def masked_string
      '<masked>'
    end
  end

  class MaskedString < String
    include Masked
  end

  class MaskedRegexp < Regexp
    include Masked
  end
end
