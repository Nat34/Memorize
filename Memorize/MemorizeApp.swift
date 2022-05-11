//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nathan Thomas on 4/25/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
