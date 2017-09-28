# Rack::InvalidUriProtector

Rack::InvalidUriProtectorはRack/Ruby on Railsに対する無効なbyte sequenceアクセスからアプリケーションを守ります。
ご自身のアプリケーションが次のリクエストに応答できるか、コピペしてアクセスしてみてください。

`/?%28t%B3odei%29`

もし対策ができていなければ、次のエラーが出るはずです。

```
ArgumentError: invalid byte sequence in UTF-8
```

このライブラリでは、無効なbyte sequenceを含んだアクセスがあると、400 Bad requestを返します。

## Installation

Gemfileに以下の行を加えます:

    gem 'rack-invalid_uri_protector'

そして次を実行します:

    $ bundle

または、個別にインストールすることも出来ます:

    $ gem install rack-invalid_uri_protector

Railsでは`application.rb`に以下のコードを追加してください:

``` ruby
config.middleware.use Rack::InvalidUriProtector
```

## License

Copyright Shigeki Masuda.

Released under an [MIT License](http://opensource.org/licenses/MIT).