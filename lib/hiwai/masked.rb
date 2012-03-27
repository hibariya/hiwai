module Hiwai
  module Masked
    def masked_string
      '<masked>'
    end

    alias_method :to_s, :masked_string
    alias_method :inspect, :masked_string
  end

  class MaskedString < String
    include Masked
  end

  class MaskedRegexp < Regexp
    include Masked
  end
end
