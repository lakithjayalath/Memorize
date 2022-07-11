//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Lakith Jayalath on 2022-06-18.
//

import SwiftUI

// Observable objects can publish to the app that something changed
// ViewModel - be the intermediary between the Model and the View
class EmojiMemoryGame: ObservableObject {
    
    // static - it's global but the name is actually EmojiMemoryGame.emojis
    /* static is used to prevent the - "Cannot use member 'emojis' within property initializer, property initializers run before 'self' is available" error. The reason this error occurs is because you cannot initialize another variable with 'emojis' if 'emojis' has not still been initialized */
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    
    // type function
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOffCards: 3) { pairIndex in
            // EmojiMemoryGame.emojis[pairIndex]
            // type inference emojis[pairIndex]
            emojis[pairIndex]
        }
    }
    
    
    // allows ViewModel to announce that something has changed when ever the model changes
    //    var objectWillChange: ObservableObjectPublisher
    
    // private - to protect the model from Views to prevent them changing things
    // private - only ViewModel's code can see the model
    
    // private(set) - other classes and structs can look at the model but can't change it
    // @Published - anytime the model changes it will automatically announce it
    @Published private var model: MemoryGame<String> = createMemoryGame()

    // because the view needs to see the model or the cards to make them while keeping the model private
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
//    func foo() {
//        let x = EmojiMemoryGame.emojis
//    }
    
    // MARK: - User Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
