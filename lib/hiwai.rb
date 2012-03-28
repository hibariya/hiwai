require 'hiwai/version'
require 'hiwai/object'
require 'hiwai/masked'

module Hiwai
  class Censored < StandardError; end

  GEM_ROOT = File.dirname(__FILE__) + '/..'

  class << self
    attr_accessor :dictionary

    def censorable_words
      @censorable_words ||=
        File.read(dictionary).split("\n").map {|line|
          MaskedString.new(decode_censorable(line))
        }
    end

    def reset!
      @censorable_words = nil
    end

    def decode_censorable(str)
      str.unpack('m').join.force_encoding('utf-8')
    end
  end
end

Hiwai.dictionary = Hiwai::GEM_ROOT + '/vendor/hiwai.txt'
