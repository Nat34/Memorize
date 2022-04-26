//
//  ContentView.swift
//  Memorize
//
//  Created by Nathan Thomas on 4/25/22.
//

import SwiftUI

struct ContentView: View {
     var emojis = ["train emoji", "car emoji", "boat emoji", "mountain emoji"]
     @State var emojiCount = 2

    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItems(), GridItems(), GridItems()]) {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji
                    CardView(content: emoji)
                })
            }
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)

        }
        .padding(.horizontal)
    }

    var remove: some View {
        Button(action: {
            emojiCount -= 1
        }, label: {
            VStack {
                Text("Remove")
                Text("Card")
            }
        })
    }

    var add: some View {
        Button(action: {
            emojiCount += 1
        }, label: {
            VStack {
                Text("Add")
                Text("Card")
            }
        })
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

