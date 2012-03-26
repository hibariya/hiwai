# coding: utf-8

module ExampleGroupHelper
  def censored
    Base64.decode64('PDzjgajjgabjgoLljZHnjKXjgarmloflrZfliJc+Pg==').force_encoding('utf-8')
  end
end
