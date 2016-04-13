# check_gems

## 概要
RubyGem.orgの脆弱性問題チェック用ツール

以下に報告されたRubyGems.orgの脆弱性問題において、インストールされているgemが
改ざんの可能性があるgemなのかをチェックするためのツールです。

http://blog.rubygems.org/2016/04/06/gem-replacement-vulnerability-and-mitigation.html

参考サイト

https://moneyforward.com/engineers_blog/2016/04/11/rubygems-org-vulnerability/

## インストール

以下の環境で実装しています。

|application|version|
|:--|:--|
|ruby|2.0.0|
|postgresql|9.5|

rubygemsのデータは、以下より最新のデータを取得してください。

https://rubygems.org/pages/data

`config/secrets.yml` および `config/database.yml` は含まれていません。

