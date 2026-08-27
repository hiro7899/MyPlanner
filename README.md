# PolyCafe Planner

## プロジェクト概要

Spring FrameworkとMyBatisを使用したWebベースのプランナーアプリケーションです。ユーザーは自分のプランを作成・管理し、他のユーザーと投稿を共有することができます。

## 技術スタック

- **Java 11**
- **Spring Framework 4.3.30.RELEASE**
- **MyBatis 3.5.16**
- **Oracle Database (ojdbc10)**
- **Maven**
- **JSP/JSTL**
- **Hibernate Validator** (バリデーション)

## 主な機能

### 1. 会員管理機能

**会員登録・認証**
- 新規会員登録機能
- ログイン・ログアウト機能
- セッション管理による認証状態維持

**会員情報管理**
- 会員一覧表示（管理者専用）
- 会員情報の追加・更新・削除
- 入力バリデーション（ID: 4-16文字、パスワード: 4-16文字）

**会員モデル**
- ID、パスワード、名前、電話番号、メールアドレス
- 権限レベル（role: 一般ユーザー/管理者）

### 2. プランナー管理機能

**プラン作成・管理**
- 新規プランの作成
- プラン一覧表示
- プラン詳細表示
- プランの更新・削除

**マイページ機能**
- 自分のプラン一覧表示
- プランの作成・削除・名前変更
- 直感的なUIでのプラン管理

**プランモデル**
- プランID、会員ID、プラン名

### 3. 投稿管理機能

**投稿作成・管理**
- 新規投稿の作成
- 投稿一覧表示
- 投稿詳細表示
- 投稿の更新・削除

**画像アップロード機能**
- 投稿への画像添付
- UUIDを使用した一意のファイル名生成
- ファイルアップロード処理

**投稿モデル**
- 投稿ID、会員ID、タイトル、詳細内容
- 作成日、更新日
- いいね数（point）
- 画像リスト

### 4. カレンダー機能

**スケジュール管理**
- プランごとのスケジュール登録
- 開始日・終了日の設定
- スケジュール詳細内容の登録

**カレンダーモデル**
- カレンダーID、プランID
- 詳細内容、開始日、終了日

### 5. 権限管理機能

**インターセプターによるアクセス制御**
- **AdminInterceptor**: 管理者権限（role=99）の検証
  - 管理者ページへのアクセス制限
  - 非ログイン時はログインページへリダイレクト
  - 一般ユーザーはトップページへリダイレクト

- **UserInterceptor**: 一般ユーザー認証
  - ログイン状態の検証
  - 非ログイン時はログインページへリダイレクト

### 6. その他の機能

**文字エンコーディング**
- UTF-8エンコーディングフィルター
- 日本語・韓国語対応

**バリデーション**
- Hibernate Validatorを使用した入力チェック
- カスタムエラーメッセージ表示

**データベース接続**
- Apache Commons DBCP2によるコネクションプーリング
- MyBatis統合によるSQLマッピング

## プロジェクト構造

```
src/main/java/kr/ac/kopo/
├── controller/          # コントローラー層
│   ├── MemberController.java
│   ├── PlanController.java
│   ├── PostController.java
│   └── RootController.java
├── service/            # サービス層
│   ├── MemberService.java
│   ├── PlanService.java
│   └── PostService.java
├── dao/                # データアクセス層
│   ├── MemberDao.java
│   ├── Plandao.java
│   └── PostDao.java
├── model/              # データモデル
│   ├── Member.java
│   ├── Plan.java
│   ├── Post.java
│   ├── Calender.java
│   ├── Photo.java
│   └── Reply.java
└── interceptor/        # インターセプター
    ├── AdminInterceptor.java
    └── UserInterceptor.java

src/main/resources/
├── mapper/             # MyBatis SQLマッパー
│   ├── member.xml
│   ├── plan.xml
│   ├── post.xml
│   └── calender.xml
├── mybatis-config.xml  # MyBatis設定
└── log4j.xml           # ログ設定

src/main/webapp/
├── WEB-INF/
│   ├── views/          # JSPビュー
│   │   ├── index.jsp
│   │   ├── login.jsp
│   │   ├── signup.jsp
│   │   ├── member/
│   │   ├── plan/
│   │   └── post/
│   └── spring/         # Spring設定
│       ├── root-context.xml
│       └── appServlet/servlet-context.xml
└── resources/          # 静的リソース
    ├── css/
    ├── js/
    └── images/
```

## ビルドと実行

### 必要条件
- Java 11以上
- Maven 3.x
- Oracle Database

### ビルド手順
```bash
mvn clean package
```

### 実行手順
1. データベースを設定する
2. アプリケーションサーバー（Tomcatなど）にデプロイする
3. ブラウザで `http://localhost:8080/` にアクセスする

## URLマッピング

| パス | 機能 | アクセス権限 |
|------|------|-------------|
| `/` | トップページ | 全員 |
| `/login` | ログインページ | 全員 |
| `/signup` | 会員登録 | 全員 |
| `/logout` | ログアウト | ログインユーザー |
| `/member/list` | 会員一覧 | 管理者のみ |
| `/member/add` | 会員追加 | 管理者のみ |
| `/member/update/{id}` | 会員更新 | 管理者のみ |
| `/member/delete/{id}` | 会員削除 | 管理者のみ |
| `/plan/list` | プラン一覧 | 管理者のみ |
| `/plan/add` | プラン追加 | 管理者のみ |
| `/plan/mypage` | マイページ | ログインユーザー |
| `/plan/user_add` | プラン作成 | ログインユーザー |
| `/plan/user_delete/{id}` | プラン削除 | ログインユーザー |
| `/post/list` | 投稿一覧 | 管理者のみ |
| `/post/add` | 投稿追加 | ログインユーザー |
| `/post/view/{id}` | 投稿詳細 | 全員 |
| `/post/update/{id}` | 投稿更新 | ログインユーザー |
| `/post/delete/{id}` | 投稿削除 | 管理者のみ |

## データベース設定

データベース接続情報は `root-context.xml` で設定してください。

```xml
<bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource">
    <property name="driverClassName" value="oracle.jdbc.OracleDriver"/>
    <property name="url" value="jdbc:oracle:thin:@localhost:1521:XE"/>
    <property name="username" value="your_username"/>
    <property name="password" value="your_password"/>
</bean>
```

## 機能の特徴

### セキュリティ
- インターセプターによる役割ベースのアクセス制御
- セッション管理による認証状態維持
- 入力バリデーションによるデータ保護

### ユーザビリティ
- 直感的なマイページUI
- 画像アップロード機能
- レスポンシブデザイン

### 管理機能
- 管理者ダッシュボード
- 会員・プラン・投稿の一元管理
- 詳細な管理画面

## ライセンス

このプロジェクトは教育目的で作成されました。

## 作者

KOPO（韓国ポリテクニック大学）