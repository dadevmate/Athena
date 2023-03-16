//
//  HomeworkGenApp.swift
//  HomeworkGen
//
//  Created by Nethan on 13/3/23.
//

import SwiftUI

@main
struct HomeworkGenApp: App {
    @StateObject var vm = ViewModel(api: ChatGPTAPI(apiKey: "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"))
    var body: some Scene {

            WindowGroup {
                NavigationStack {
                    ContentView(vm: vm)
                        .toolbar {
                            ToolbarItem {
                                Button("Clear") {
                                    vm.clearMessages()
                                }
                                .disabled(vm.isInteractingWithChatGPT)
                            }
                        }
                }
            }

        
    }
}
