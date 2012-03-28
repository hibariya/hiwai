# Hiwai

レシーバがひわいかどうかを確認します。
公の場で表示されると困る文字列をフィルタするのが目的です。

そのような文字列をなるべく目にしないで管理できるようにすることも目標にしています。

## Installation

**under construction**

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

今は単純にレシーバをto_sした結果をString#matchでマッチさせています（もっと精度の高い方法にしたい）。
ワードの一覧はvendor/hiwai.txtの下に改行区切で置いています（まだ何もない）。
管理するときになるべく見ないためにBase64エンコーディングしています。

マッチ候補の文字列はHiwaiモジュールが持っていますが、inspectしたときにうっかり表示されないように拡張しています。

## 単語リストの管理

### 対話モードで単語を追加

デフォルトの単語リスト`vendor/hiwai.txt`に単語を追加できます。

```
rake dic:interactive
```

できることは追加だけです。`crtl+d`で追加した単語が保存されます。それまでの入力を破棄するには`ctrl+c`します。

入力した文字は普通にエコーバックされます。

### 素のままで編集する

**リダイレクトしなければあられもない文字列たちが標準出力に出力されます。**

1. 単語リストをプレーンなテキストに展開します

```
cat path/to/dictionary | rake dic:expand > temporary
```

2. がんばって編集したのち保存します

3. 変換して上書きします

```
cat temporary | rake dic:serialize > path/to/dictionary
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

