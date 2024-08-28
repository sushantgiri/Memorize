//
//  ContentView.swift
//  Memorize
//
//  Created by Sushant Giri on 28/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                ZStack {
                    base.fill(.white)
                    base.stroke(lineWidth: 1.0)
                        .stroke()
                    Text("😀")
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
