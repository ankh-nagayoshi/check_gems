# check_gems(RubyGems.orgの脆弱性問題チェック用ツール)

## 概要

以下に報告されたRubyGems.orgの脆弱性問題において  
インストールされているgemが改ざんの可能性があるgemなのかをチェックするためのツールです。  

http://blog.rubygems.org/2016/04/06/gem-replacement-vulnerability-and-mitigation.html

## 参考サイト

https://moneyforward.com/engineers_blog/2016/04/11/rubygems-org-vulnerability/
http://d.hatena.ne.jp/kanonji/20110304/1299211488

## 動作環境

以下の環境で実装しています。  
gemについては `Gemfile` または `Gemfile.lock` を確認してください。  

|application|version|
|:--|:--|
|ruby|2.0.0|
|postgresql|9.5|

rubygemsのダンプデータは、以下より最新のものを取得してください。  

https://rubygems.org/pages/data

`config/database.yml` は含まれていません。  
