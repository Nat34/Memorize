//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nathan Thomas on 5/3/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis: [String: [String]] =
            [
                "car": ["๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ "],
                "tshirt": ["๐งข", "๐", "๐งค", "๐งฃ", "๐", "๐", "๐ฅ", "๐", "๐งฅ", "๐"],
                "calendar": ["๐ฅ", "๐ช", "๐", "๐", "๐ฝ", "๐ช", "๐ช", "๐ก"]
            ]
    
    static let emojis_ = ["๐ฅ", "๐ช", "๐", "๐", "๐ฝ", "๐ช", "๐ช", "๐ก"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis_[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
}
