# coding: utf-8

require 'spec_helper'
require 'fileutils'

describe Hiwai::CensorableWords do
  def load_words(str)
    Hiwai::CensorableWords.load str
  end

  def dump_words(arr)
    Hiwai::CensorableWords.dump arr
  end

  let(:serialized) { dump_words(%w(ワカラナイ シラナイ コムギコカナニカダ)) }

  describe '.load' do
    subject { load_words(serialized) }

    it { should include 'ワカラナイ' }
    it { should include 'シラナイ' }
    it { should include 'コムギコカナニカダ' }
  end

  describe '.dump' do
    let(:censorable_words) { load_words serialized }

    before do
      censorable_words << 'ドイツ村'
    end

    subject { load_words(dump_words(censorable_words)) }

    it { should have(4).words }
    it { should include 'ドイツ村' }
  end
end
