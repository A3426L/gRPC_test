# gRPC_test

このリポジトリは、Swift および Python を使用して gRPC の動作をテストするためのサンプルプロジェクトです。gRPC の学習や、Swift と Python 間の通信の検証を目的としています。

## 📁 ディレクトリ構成

```
gRPC_test/
├── gRPC_test.xcodeproj/ # Xcode プロジェクトファイル（Swift クライアント）
├── gRPC_test/ # Swift クライアントのソースコード
├── server/ # Python 製 gRPC サーバーの実装
├── test/ # テストコード（詳細不明）
└── hello.proto # gRPC サービス定義ファイル（Protocol Buffers）
```

## 🚀 動作環境

- Swift 5.x（Xcode 12 以降推奨）
- Python 3.x
- gRPC 関連パッケージ：
  - Python: `grpcio`, `grpcio-tools`
  - Swift: `SwiftGRPC` または `gRPC-Swift`
    
## Swift クライアントのセットアップ
1. hello.proto から Swift コードを生成（protoc と protoc-gen-swift が必要）：

`protoc --swift_out=gRPC_test --swiftgrpc_out=gRPC_test hello.proto`

2. Xcode で gRPC_test.xcodeproj を開き、ビルドして実行。

