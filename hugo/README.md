# 準備
1. Install hugo
```sh
% brew install hugo
```
2. Clone theme
```sh
% cd hugo/themes
% git clone https://github.com/pdevty/material-design
```
3. Install gnu-sed
```sh
% brew install gnu-sed
```
# 記事について
## 画像
画像は`content/images/{issue_id}`に配置する

ショートコードを使う
```
{{<figure src="">}}
```

必要に応じてwebp変換を行う
```
% brew install webp
% make cwebp FROM={path} TO={path}

ex) make cwebp FROM=./content/images/85/foo.png TO=./content/images/85/foo.webp
```
# デプロイ手順
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
# ローカル実行
```sh
% hugo server
```



