//
//  ContentView.swift
//  Memorize
//
//  Created by Trapped Beast on 2023/12/28.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🥸", "🤩", "🥳", "😏", "😤"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundStyle(.cyan)
    }
        
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 25.0)
            if(isFaceUp){
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else{
                base.foregroundStyle(.brown)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
