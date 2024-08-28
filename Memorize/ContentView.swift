//
//  ContentView.swift
//  Memorize
//
//  Created by Sushant Giri on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😀","😍", "😇", "🤓","🥹","🙃","🥳","😎","😒","😋"]
    @State private var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                card
            }
            cardAdjusters
        }
        .padding()
    }
    
    var cardAdjusters: some View {
        HStack {
           cardRemover
           Spacer()
           cardAdder

        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var card: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
            
        }.foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName:symbol )
        }.disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
        
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    @State var isFaceUp = true
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
                Group {
                    base.fill(.white)
                    base.stroke(lineWidth: 1.0)
                        .stroke()
                    Text(content)
                }
                .opacity(isFaceUp ? 1 : 0)
            
            base.opacity(isFaceUp ? 0: 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
