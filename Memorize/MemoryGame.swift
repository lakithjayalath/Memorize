//
//  MemoryGame.swift
//  Memorize
//
//  Created by Lakith Jayalath on 2022-06-17.
//

import Foundation

// In generics or “don’t care types” the “==” cannot be used. Therefore they should be set to Equatable.
struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    // mutating - calling this function is going to change the struct even though it is Immutable
    mutating func choose(_ card: Card) {
//        if let chosenIndex = index(of: card) {
        // if let is used then "&&" cannout be used. Instead used a ",".
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
//                for index in 0..<cards.count {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
//    func index(of card: Card) -> Int? {
//        for index in 0...cards.count {
//            if (cards[index].id == card.id) {
//                return index
//            }
//        }
//        return nil
//    }
    
    init(numberOfPairsOffCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOffCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    // Identifiable - just a single var that is used to identify this struct against all other card structs
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        // id (ObjectIdentifier) should be of type Hashable or Equatable
        var id: Int
    }
}
