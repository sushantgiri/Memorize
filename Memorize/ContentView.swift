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
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                ZStack {
                    RoundedRectangle(cornerRadius: 20).foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                    Text("😀")
                }
            }else{
                RoundedRectangle(cornerRadius: 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
