# swifttest

アプリケーションそのものは簡単なカウンターアプリです。  
UIButtonをタップするとカウンターラベルが加算されます。  

## ユニットテスト
- ViewControllerの生成が想定通りか検証します。  
accessibitlyIdentifierで該当のものを検索し、ラベルテキストが一致するか検証します。

## UIテスト
- ボタンをタップした結果がラベルに反映されているかを検証します。
- タップを10回連続行った結果のパフォーマンス測定をしています。

## ワインポイントノート
- `Build Settings`のrunpathに"${FRAMEWORK_SEARCH_PATHS}"を追加する
$ swift package init
$ swift package generate-xcodeproj