# ローカル実行
1. Clone theme
```sh
% cd hugo/themes
% git clone https://github.com/pdevty/material-design
Cloning into 'material-design'...
remote: Enumerating objects: 172, done.
remote: Total 172 (delta 0), reused 0 (delta 0), pack-reused 172
Receiving objects: 100% (172/172), 2.23 MiB | 2.11 MiB/s, done.
Resolving deltas: 100% (55/55), done.
```
2. Run local server
```sh
% hugo server
```
3. Access [localhost:1313/neta/posts/28](http://localhost:1313/neta/posts/28)

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




