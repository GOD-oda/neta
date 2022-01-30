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
# デプロイ手順
1. githubのissueからhugoの記事作成
```sh
% ruby copy-issue.rb {ISSUE_ID}
```
2. 作成した記事をデプロイ（実際は公開ディレクトリへコピー）
```sh
% sh deploy.sh
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



