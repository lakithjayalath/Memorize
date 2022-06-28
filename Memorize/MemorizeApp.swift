//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Lakith Jayalath on 2022-05-24.
//

import SwiftUI

@available(iOS 14.0, *)
@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
