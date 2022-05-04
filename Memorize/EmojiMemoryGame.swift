//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nathan Thomas on 5/3/22.
//

import SwiftUI

class EmojiMemoryGame {
    var model: MemoryGame<String> = MemoryGame<String>()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
