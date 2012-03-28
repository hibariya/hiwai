# coding: utf-8

module Hiwai
  module CensorableWords
    extend self

    def dump(words)
      words.map {|word| encode(word) }.join
    end

    def load(string)
      string.split("\n").map {|word| MaskedString.new(decode(word)) }
    end

    def decode(str)
      str.unpack('m').join.force_encoding(Encoding::UTF_8)
    end

    def encode(str)
      [str].pack('m')
    end
  end
end
