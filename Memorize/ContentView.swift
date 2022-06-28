//
//  ContentView.swift
//  Memorize
//
//  Created by Lakith Jayalath on 2022-05-24.
//

import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View { // function
    
    // @ObservedObject - when the ViewModel says something changed then rebuild the entire body
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .bold()
        Spacer()
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }

}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {  // view builder
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}




@available(iOS 14.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
