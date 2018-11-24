# Rails5 API Devise-JWT Authentication Demo

Rails5のAPIモードに於いて、Devise-JWTを利用したJWTトークン認証機能の実装をしてみる。

このデモでは、JWTトークン戦略はWhiteListを採用した。

会員登録  
POST /
```
{ 
    user: {
        email: 'メールアドレス',
        password'パスワード''
    }
}
```

ログイン
POST /signin  
このリクエストが成功すると、レスポンスヘッダにJWTトークンが発行される
```
Headers
JWT_AUD 'クライアント識別子'
（自由。PC,Smartphoneなど入れておけばいいのでは？）

Parameters
{ 
    user: {
        email: 'メールアドレス',
        password'パスワード''
    }
}
```

ログアウト
POST /signout
このリクエストが成功すると、WhitelistJwtsからトークンが削除される
```
Headers
Authorization 'Bearer `発行されたJWTトークン`'
```

資料  
[devise](https://github.com/plataformatec/devise)

認証機能のベースとなるDevise。Devise自体はRackミドルウェア実装であるWardenをラップしてRailsアプリケーションで使いやすくしたもの。

[devise-jwt](https://github.com/waiting-for-dev/devise-jwt)

Devise-JWTはDeviseと組み合わせてJWT認証機能を構築するGem。  
APIサーバの認証用途などで利用される。

[JSON Web Token (JWT) draft-ietf-oauth-json-web-token-11](https://openid-foundation-japan.github.io/draft-ietf-oauth-json-web-token-11.ja.html])

JWT仕様の日本語ドキュメント（ありがてぇ！）

課題
- ルーティングが汚い
- 使われないルートが存在する
- 使われないコントローラも生成してしまった
- テストがない