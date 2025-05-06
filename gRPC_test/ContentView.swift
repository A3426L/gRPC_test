//
//  ContentView.swift
//  gRPC_test
//
//  Created by aru on 2025/05/04.
//

import SwiftUI
import GRPCCore
import GRPCNIOTransportHTTP2
import GRPCProtobuf
import NIO

struct ContentView: View {
    var body: some View {
        VStack {
            Text("aiueo")
            Button("test") {
                Task {
                    await run()
                    print("runnn")
                }
            }
        }
    }
        
    func run() async {
        do{
            try await withGRPCClient(
              transport: .http2NIOPosix(
                target: .ipv4(host: "127.0.0.1", port: 31415),
                transportSecurity: .plaintext
              )
            ) { client in
              let greeter = HelloService.Client(wrapping: client)
              let reply = try await greeter.sayHello(.with { $0.name = "Swift" })
              print(reply.message)
            }
        } catch {
            await MainActor.run {
                 print("エラー: \(error.localizedDescription)")
            }
        }
    }
}



#Preview {
    ContentView()
}
