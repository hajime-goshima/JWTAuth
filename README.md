# Rails5 API Devise-JWT Authentication Demo

Rails5のAPIモードに於いて、Devise-JWTを利用したJWTトークン認証機能の実装をしてみる。
このデモでは、WhiteList式のJWTトークン戦略を採用した。


## リクエスト
### 会員登録  
ユーザの会員登録を行う。成功した場合、UserのEmail等を返却する。

- Request Path
```
POST /
```

- Request Parameters
```
user: {
    email: 'test01@test.com',
    password: 'abcd1234''
}
```

- Response Body
```
{"id":1,"email":"test01@test.com","created_at":"2018-11-24T07:51:10.311Z","updated_at":"2018-11-24T07:51:10.311Z"}
```

### サインイン
ユーザによるサインインを行う。  
このリクエストが成功すると、レスポンスヘッダにJWTトークンが発行される。


- Request Path
```
POST /signin
```

- Request Header
```
JWT_AUD: 'クライアント識別子'
```
> 受信したトークンが最初に同じクライアントに発行されたかどうかを検証audし、aud_headerヘッダ値が一致するかどうかを確認するために使用されます。クライアントを区別したくない場合は、そのヘッダーを指定する必要はありません。

このデモでは必須にしている。

- Request Parameters
```
{ 
    user: {
        email: 'メールアドレス',
        password'パスワード''
    }
}
```

### サインアウト
このリクエストが成功すると、WhitelistJwtsからトークンが削除される

- Request Path
```
POST /signout
```

- Request Header
```
Authorization 'Bearer `発行されたJWTトークン`'
```

## 資料
[devise](https://github.com/plataformatec/devise)

認証機能のベースとなるDevise。Devise自体はRackミドルウェア実装であるWardenをラップしてRailsアプリケーションで使いやすくしたもの。

[devise-jwt](https://github.com/waiting-for-dev/devise-jwt)

Devise-JWTはDeviseと組み合わせてJWT認証機能を構築するGem。  
APIサーバの認証用途などで利用される。

[JSON Web Token (JWT) draft-ietf-oauth-json-web-token-11](https://openid-foundation-japan.github.io/draft-ietf-oauth-json-web-token-11.ja.html])

JWT仕様の日本語ドキュメント

[Rails 5 API + JWT setup in minutes (using Devise)](https://medium.com/@mazik.wyry/rails-5-api-jwt-setup-in-minutes-using-devise-71670fd4ed03)
Rails 5 API + JWT　セットアップチュートリアル
ただし情報が少し古くハマリどころがあるので注意

課題
- ルーティングが汚い
- 使われないルートが存在する
- 使われないコントローラも生成してしまった
- テストがない
