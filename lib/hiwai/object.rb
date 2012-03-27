# coding: utf-8

class Object
  def hiwai?
    string = to_s

    @hiwai_matches = Hiwai.censorable_words.select {|word|
      string.match Hiwai::MaskedRegexp.new(word)
    }

    @hiwai_matches.any?
  end

  def hiwai!
    raise Hiwai::Censored, 'Receiver includes hiwai object' if hiwai?
  end

  def censored
    @hiwai_matches
  end
end
