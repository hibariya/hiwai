# coding: utf-8

require 'spec_helper'

describe Object do
  describe '#hiwai?' do
    it { "これは#{censored}です".should be_hiwai }
    it { "小麦粉か何かだ".should_not be_hiwai }
  end

  describe '#hiwai!' do
    it { expect { "これは#{censored}です".hiwai! }.should raise_error(Hiwai::Censored) }
    it { expect { "小麦粉か何かだ".hiwai! }.should_not raise_error(Hiwai::Censored) }
  end
end
