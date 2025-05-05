//
//  ContentView.swift
//  gRPC_test
//
//  Created by aru on 2025/05/04.
//

import SwiftUI
import GRPCCore
import GRPCCodeGen
import GRPCInProcessTransport
import NIO

struct ContentView: View {
    @State private var response = "未送信"

    var body: some View {
        VStack {
            Text(response)
            Button("Send Hello") {
                Task {
                    await sendHello()
                }
            }
        }
    }

    func sendHello() async {
        let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
        let channel = try! GRPCChannelPool.with(
            target: .host("127.0.0.1", port: 50051),
            transportSecurity: .plaintext,
            eventLoopGroup: group
        )

        let client = HelloServiceAsyncClient(channel: channel)
        let request = HelloRequest.with {
            $0.name = "SwiftUI"
        }

        do {
            let reply = try await client.sayHello(request)
            DispatchQueue.main.async {
                response = reply.message
            }
        } catch {
            print("RPC error: \(error)")
        }

        try? await channel.close()
        try? await group.shutdownGracefully()
    }
}


#Preview {
    ContentView()
}
