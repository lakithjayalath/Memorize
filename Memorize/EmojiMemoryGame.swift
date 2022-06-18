//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Lakith Jayalath on 2022-06-18.
//

import SwiftUI

// ViewModel - be the intermediary between the Model and the View
class EmojiMemoryGame {
    
    // static - it's global but the name is actually EmojiMemoryGame.emojis
    /* static is used to prevent the - "Cannot use member 'emojis' within property initializer, property initializers run before 'self' is available" error. The reason this error occurs is because you cannot initialize another variable with 'emojis' if 'emojis' has not still been initialized */
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    
    // type function
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOffCards: 4) { pairIndex in
            // EmojiMemoryGame.emojis[pairIndex]
            // type inference emojis[pairIndex]
            emojis[pairIndex]
        }
    }
    
    // private - to protect the model from Views to prevent them changing things
    // private - only ViewModel's code can see the model
    
    // private(set) - other classes and structs can look at the model but can't change it
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}
