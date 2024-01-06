//
//  ContentView.swift
//  Memorize
//
//  Created by Trapped Beast on 2023/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView(isFaceUp: false)
            CardView()
        }
        .padding()
        .foregroundStyle(.cyan)
    }
        
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 25.0)
            if(isFaceUp){
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🤖").font(.largeTitle)
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
