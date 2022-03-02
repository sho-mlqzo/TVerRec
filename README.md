# :tv:**TVerRec**:tv: - TVerダウンローダ -
TVerRecは、powershellのスクリプトで書かれた動画配信サイトのTverのダウンローダです。
動画を1本ずつ指定してダウンロードするのではなく、動画のジャンルや出演タレントを指定して一括ダウンロードします。
ループ実行するようになっているので、1回起動すれば新しい番組が配信される都度ダウンロードされるようになります。
動作に必要なyt-dlpやffmpegなどの必要コンポーネントは自動的に最新版がダウンロードされます。

## 前提条件
Windows10とWindows11で動作確認していますが、おそらくWindows7、8でも動作します。
PowerShellはMacOS、Linuxにも移植されてるのでメインの機能は動作するかもしれません。
一部の機能はWindowsを前提に作られているので改変なしでは動作しません。(自動更新機能など)
yt-dlpの機能を活用しているため、日本国外からもVPNを使わずにダウンロードできます。

## 実行方法
以下の手順でバッチファイルを実行してください。
1. TVerRecのzipファイルをダウロードし、任意のディレクトリで解凍してください。
2. 以下を参照して環境設定、ダウンロード設定を行ってください。
3. Windows環境では `start_tverrec.bat`を実行してください。
    - 処理が完了しても10分ごとに永遠にループして稼働し続けます。
    - 上記でPowerShellが起動しない場合は、PowerShell の実行ポリシーのRemoteSignedなどに変更する必要があるかもしれません。([参考](https://bit.ly/32HAwOK))
4. TVerRecを `start_tverrec.bat`で起動した場合は、`stop_tverrec.bat`でTVerRecを停止できます。
    - 関連するダウンロード処理もすべて強制停止されるので注意してください。
    - ダウンロードを止めたくない場合は、tverecのウィンドウを閉じるボタンで閉じてください。

## 設定内容
個別の設定はテキストエディタで変更する必要があります。
### 動作環境の設定方法
- `config/user_setting.ini`をテキストエディターで開いてユーザ設定を行ってください。
### ダウンロード対象のジャンルの設定方法
- `config/keyword.ini`をテキストエディターで開いてダウンロード対象のジャンルを設定します。
    - 不要なジャンルは `#` でコメントアウトしてください。
    - 主なジャンルは網羅しているつもりですが、不足があるかもしれません。
### ダウンロード対象外の番組の設定方法
- `config/ignore.ini`をテキストエディターで開いてダウンロードしたくない番組名を設定します。
    - ジャンル指定でダウンロードすると不要な番組もまとめてダウンロードされるので、個別にダウンロード対象外に指定できます。

## おすすめの使い方
- TVerのカテゴリ毎のページを指定して`start_tverrec.bat`で起動すれば、新しい番組が配信されたら自動的にダウンロードされるようになります。
- 同様に、フォローしているタレントページを指定して`start_tverrec.bat`で起動すれば、新しい番組が配信されたら自動的にダウンロードされるようになります。
- 同様に、各放送局毎のページを指定して`start_tverrec.bat`で起動すれば、新しい番組が配信されたら自動的にダウンロードされるようになります。

## フォルダ構成
```
tverrec/
├─ bin/ .................................... 実行ファイル格納用フォルダ
│
├─ config/ ............................... 設定フォルダ
│  ├─ ignore.ini ........................... ダウンロード対象外設定ファイル
│  ├─ keyword.ini .......................... ダウンロード対象ジャンル設定ファイル
│  ├─ system_setting.ini ................... システム設定ファイル
│  └─ user_setting.ini ..................... ユーザ設定ファイル
│
├─ db/ ................................... データベース
│  └─ tver.csv ............................. ダウンロードリスト
│
├─ debug/ ................................ デバッグ用
│
├─ src/ .................................. 各種ソース
│  ├─ common_functions.ps1 ................. 共通関数定義
│  ├─ delete_ignored.ps1 ................... ダウンロード対象外ビデオ削除ツール
│  ├─ tverrec_bulk.ps1 ..................... 一括ダウンロードツール本体
│  ├─ tverrec_functions.ps1 ................ TVer用共通関数定義
│  ├─ tverrec_single.ps1 ................... 単体ダウンロードツール
│  ├─ update_ffmpeg.ps1 .................... ffmpeg自動更新ツール
│  ├─ update_youtubedl.ps1 ................. youtube-dl自動更新ツール
│  └─ validate_video.ps1 ................... ダウンロード済みビデオの整合性チェックツール
│
├─ delete_video.bat ........................ ダウンロード対象外ビデオ削除BAT
├─ LICENSE ................................. ライセンス
├─ README.md ............................... このファイル
├─ start_tverrec.bat ....................... 一括ダウンロード起動BAT
├─ stop_tverrec.bat ........................ 一括ダウンロード終了BAT
└─ validate_video.bat ...................... ダウンロード済みビデオの整合性チェックBAT
```

## アンインストール方法
- レジストリは一切使っていないでの、不要になったらゴミ箱に捨てれば良いです。

## 注意事項
- 著作権について
    - このプログラムの著作権は dongaba が保有しています。
- 事故、故障など
    - 本ツールを使用して起こった何らかの事故、故障などの責任は負いかねますので、ご使用の際はこのことを承諾したうえでご使用ください。

## ライセンス
- TVerRecは[Apache License, Version 2.0のライセンス規約](http://www.apache.org/licenses/LICENSE-2.0)に基づき、複製や再配布、改変が許可されます。

Copyright(c) 2021 dongaba All Rights Reserved.


