# neta

## Hugo
### required

- ruby
- cwebp

### setup
```shell
% cd hugo
% cp .env.example .env
```

### install theme
```shell
% cd hugo
% mkdir -p themes
% git clone https://github.com/pdevty/material-design themes 
```

### create new post
```shell
% cd hugo
% hugo new posts/{issue_id}.md
```

### save post
```shell
% cd hugo
% ruby save_post.rb {issue_id}

ex) ruby save_post.rb 88
```

### release
```shell
% cd hugo
% sh copy-posts.sh
% cd ..
% git add .
% git commit -m 'new post'
% git push
```

### attach labels
1. github issueにラベルをつける
2. ラベルを取り込んでhugoのタグにする
```shell
% cd hugo
% ruby import_meta {issue_id}

ex) ruby import_meta 88
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

## issues
検証したサンプルコードのディレクトリ
`issues/{issue_id}`ディレクトリで区別している

## hugo
記事作成のためのディレクトリ



