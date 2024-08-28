//
//  ContentView.swift
//  Memorize
//
//  Created by Sushant Giri on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    let cards = ["😀","😍", "😇", "🤓"]
    var body: some View {
        HStack {
            ForEach(cards.indices, id: \.self){ index in
                CardView(content: cards[index])
            }
           
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                ZStack {
                    base.fill(.white)
                    base.stroke(lineWidth: 1.0)
                        .stroke()
                    Text(content)
                }
            }else{
                base
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
