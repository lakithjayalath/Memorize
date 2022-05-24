//
//  ContentView.swift
//  Memorize
//
//  Created by Lakith Jayalath on 2022-05-24.
//

import SwiftUI

struct ContentView: View { // function
    var body: some View {
        ZStack {  // view builder
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3.0)
            Text("Hello, world!")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
