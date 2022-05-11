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
                "car": ["🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔", "🚋", "🚠"],
                "tshirt": ["🧢", "👙", "🧤", "🧣", "👗", "👚", "🥋", "👖", "🧥", "👕"],
                "calendar": ["🖥", "🪑", "🛋", "🛌", "🍽", "🚪", "🪟", "💡"]
            ]
    
    static let emojis_ = ["🖥", "🪑", "🛋", "🛌", "🍽", "🚪", "🪟", "💡"]
    
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
