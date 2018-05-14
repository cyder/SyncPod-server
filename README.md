# YouTubeSyncServer
YouTubeSyncのサーバ用リポジトリです。

## 必要環境
* Xcode Command line tools
* [Homebrew](https://brew.sh/index_ja.html)
* [rbenv](https://github.com/rbenv/rbenv)
* [Ruby 2.4.1](https://github.com/ruby/ruby)
* [Ruby on Rails 5.1.2](https://github.com/rails/rails)
* [bundler](http://bundler.io/)
* [mysql2 0.4.8](https://github.com/brianmario/mysql2)
* [editorconfig plugin](http://editorconfig.org/#download)

### Xcode Command line tools
AppStoreからXcodeをインストールし、以下のコマンドを実行する。
```sh
xcode-select --install
```

### Homebrew
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### rbenv
```sh
brew update
brew install rbenv ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile
```

### Ruby 2.4.1
```sh
rbenv install 2.4.1
```

### Ruby on rails 5.1.2
```sh
gem install rails -v 5.1.2
```

### bundler
```sh
gem install bundler
```

### mysql
```sh
brew install mysql
```

### editorconfig plugin
[ここ](http://editorconfig.org/#download)からエディタに合わせたものをインストールすること。

## セットアップ
1. 次のコマンドを実行する。
```sh
git clone git@github.com:cyder/SyncPod-server.git
cd SyncPod-server
```

2. Gemライブラリをインストールする
```sh
bundle install --path=vendor/bundle
```

3. MySqlを起動する
```sh
mysql.server start
```

4. Databaseを作成する
```sh
rails db:create
rails db:migrate
rails db:seed
```

5. サーバを起動する
```sh
rails server
```

その他は[/doc](./doc)にまとまっています。

## 著者
* [森 篤史](@Mori-Atsushi)
