Ideash::Application.config.session_store :redis_store, {
    servers: [
        {
            host: "team5.work",  # Redisのサーバー名
            port: 6379,         # Redisのサーバーのポート
            db: 0,              # データベースの番号(0 ~ 15)の任意
            namespace: "session"  # 名前空間。"session:セッションID"の形式
        },
    ],
    expire_after: 90.minutes # 保存期間
}
