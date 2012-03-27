# coding: utf-8

require 'spec_helper'

describe Hiwai do
  describe '.censorable_words' do
    subject { Hiwai.censorable_words }

    its(:inspect) { should_not match /#{censored}/ }
    its(:to_s) { should_not match /#{censored}/ }
  end
end
