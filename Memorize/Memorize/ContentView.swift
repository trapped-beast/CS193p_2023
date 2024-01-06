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
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack () {
            if(isFaceUp){
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 25.0)
                    .strokeBorder(lineWidth: 2)
                Text("🤖").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.brown)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
