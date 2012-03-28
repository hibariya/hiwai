require 'hiwai/version'
require 'hiwai/object'
require 'hiwai/masked'
require 'hiwai/censorable_words'

module Hiwai
  class Censored < StandardError; end

  GEM_ROOT = File.dirname(__FILE__) + '/..'

  class << self
    attr_accessor :dictionary

    def censorable_words
      @censorable_words ||= CensorableWords.load(read_dictionary)
    end

    def reset!
      @censorable_words = nil
    end

    def read_dictionary
      File.read(dictionary)
    end
  end
end

Hiwai.dictionary = Hiwai::GEM_ROOT + '/vendor/hiwai.txt'
