# neta

## Hugo
### 1. Run setup command
```shell
% make setup
```
### 記事について
#### 画像
画像は`hugo/content/images/{issue_id}`に配置する

ショートコードを使う
```
{{<figure src="">}}
```

必要に応じてwebp変換を行う
```
% brew install webp
% make cwebp FROM={path} TO={path}

ex) make cwebp FROM=./hugo/content/images/85/foo.png TO=./hugo/content/images/85/foo.webp
```
#### TODO: デプロイ手順
1. githubのissueからhugoの記事作成
```sh
% make import ID={issue_id}
```
2. 作成した記事をデプロイ（実際は公開ディレクトリへコピー）
```sh
% make deploy
```
3. 全てgitに保存
```sh
% cd ../
% git add .
% git commit
% git push
```

## issues
検証したサンプルコードのディレクトリ
`issues/{issue_id}`ディレクトリで区別している

## hugo
記事作成のためのディレクトリ



