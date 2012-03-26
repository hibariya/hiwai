require 'base64'
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
          # TODO: support other encoding
          str = Base64.decode64(line).force_encoding('utf-8')

          MaskedString.new(str)
        }
    end

    def reset!
      @censorable_words = nil
    end
  end
end

Hiwai.dictionary = Hiwai::GEM_ROOT + '/vendor/hiwai.txt'
