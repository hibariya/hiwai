# Hiwai

レシーバがひわいかどうかを確認します。
公の場で表示されると困るオブジェクトをフィルタするのが目的です。

そのような文字列をなるべく目にしないで管理できるようにすることも目標にしています。

## Installation

** under construction **

Add this line to your application's Gemfile:

    gem 'hiwai'

Or install it yourself as:

    $ gem install hiwai

## Usage

```ruby
require 'hiwai'

# if you have your own dictionary
Hiwai.dictionary = 'path/to/dictionary'

# String
'hibariya'.hiwai? # => false
'とっても<<よくない文字列>>です'.hiwai? # => true
'とっても<<よくない文字列>>です'.hiwai! # Hiwai::Censored: Receiver includes hiwai object

# Array
['とっても<<よくない文字列>>です'].hiwai? # => true
```

今は単純にString#matchでマッチさせています（もっと精度の高い方法にしたい）。
ワードの一覧はvendor/hiwai.txtの下に改行区切で置いています（まだ何もない）。
管理するときになるべく見ないためにBase64エンコーディングしています。

マッチ候補の文字列はHiwaiモジュールが持っていますが、inspectしたときにうっかり表示されないように拡張しています。

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
