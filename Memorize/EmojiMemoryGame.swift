//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nathan Thomas on 5/3/22.
//

import SwiftUI

class EmojiMemoryGame {
    
    private var model: MemoryGame<String> =
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in "😀" }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
