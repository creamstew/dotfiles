### SSH設定
```
$ make set_ssh_config
```

### Git設定
```
$ vi .gitconfig.local

[user]
    name = xxx xxx
    email = xxx@xxx

$ ssh-keygen -t ed25519 -N "" -f ~/.ssh/github -C sample@example.com
$ pbcopy < ~/.ssh/github.pub
```
あとはGitHub上で設定

### dotfiles 実行
```
$ make bootstrap.sh
```

### 最初にやること
#### ソフトウェア・アップデート
(appleマーク) > このmacについて > ソフトウェアアップデート

#### App Store
(appleマーク) > App Store > すべてアップデート

#### 隠しファイルを表示する
```
$ defaults write com.apple.finder AppleShowAllFiles -boolean true
```

#### 共有フォルダで .DS_Store ファイルを作成しない
```
$ defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

### Macシステム環境設定
#### 一般
 - スクロールバーの表示 > 常に表示 にする
#### Dock
 - サイズ: お好みで
 - 拡大: お好みで
 - 画面上の位置: 左、下、右 お好みで
 - Dockを自動的に表示/非表示 お好みで

#### ディスプレイ
 - ディスプレイ > 解像度 > 変更 > スペースを拡大

#### 省エネルギー
 - バッテリー > バッテリー電源使用時はディスプレイを少し暗くする > チェックを外す
 - メニューバーにバッテリーの状況を表示 > チェックを入れる
 - メニューバーの電池マークをクリック「割合(%)を表示」にチェックを入れる

#### トラックパッド
 - 軌跡の速さを最速に

#### キーボード
 - キーボード
   - キーのリピート
      - 最速設定
   - リピート入力認識までの時間
      - 最短設定
   - Touch Barに表示する項目
      - F1、F2などのキーを表示

#### セキュリティとプライバシー
 - 一般
    - スリープとスクリーンセーバの解除にパスワードを要求（15分くらいにする）
    - ダウンロードしたアプリケーションの実行許可
    - Mac App Store と確認済みの開発元からのアプリケーションを許可
 - プライバシー > アクセシビリティ
    - AppStoreに登録されていない野良アプリはここに登録して実行を許可してあげる必要がある。
 - ファイアウォール > ファイアウォールをオン にする

#### ネットワーク
Google Public DNS設定
 - https://ja.wikipedia.org/wiki/Google_Public_DNS
 - https://www.geekpage.jp/blog/?id=2011/9/22/1

 - 接続済みのネットワークの詳細を表示
    - DNS > DNS サーバ
    - 8.8.8.8
    - 8.8.4.4
    - 上記のアドレスを登録する。（Google Public DNS）

#### 共有
 - コンピュータ名を変更(AirDropに表示される名前)

#### Finder
 ##### デスクトップに表示させるアイコン
 - Finder > 一般 > デスクトップに表示させる項目 > 接続中のサーバ にチェックを入れる

 ##### ファイルの拡張子を表示する
 - Finder > 環境設定 > 詳細 > すべてのファイル名拡張子を表示 にチェックする
 - Finder > 環境設定 > 詳細 > 名前で並び変えるときにフォルダを上部に表示 にチェックする
 - Finder > 環境設定 > 詳細 > 拡張子を変更する前に警告を表示 のチェックを外す（お好みで）

 ##### サイドバーに表示する項目
 - Finder > 環境設定 > サイドバー 表示したい項目をお好みで設定
 - Finderのサイドバーのよく使う項目は ディレクトリをドラッグ＆ドロップで追加できる
 - 外したい時は右クリックして サイドバーから削除

 ##### ウィンドウ情報
 - Finder > 表示 > タブバーを表示 にする
 - Finder > 表示 > パスバーを表示 にする
 - Finder > 表示 > ステータスバーを表示 にする
 - Finder > 表示 > 表示オプションを表示 > 並べ替え > なし
   - 表示オプションを表示した際に、デスクトップをクリックする
 - Finder > 表示 > 表示オプションを表示 > 表示順序 > グリッドに沿う

### VSCode設定
VSCodeの設定をオンライン上で保存し、復元できる VSCode 拡張「Settings Sync」を利用する
 - [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
 - [【最新版】VSCodeの設定を共有しよう【Settings Sync】](https://qiita.com/kazurego7/items/3dc5a381811e4d429533)

### 参考
 - [Mac を買ったら必ずやっておきたい初期設定](https://qiita.com/ucan-lab/items/c1a12c20c878d6fb1e21#mac%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E7%92%B0%E5%A2%83%E8%A8%AD%E5%AE%9A)
