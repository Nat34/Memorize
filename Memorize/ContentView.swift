//
//  ContentView.swift
//  Memorize
//
//  Created by Nathan Thomas on 4/25/22.
//

import SwiftUI

struct ContentView: View {
     var emojis = ["✈️", "💄", "🎃", "🐋", "🦞", "🍅", "🥬", "🔦", "📪", "📦", "🕰", "🏔", "🚗", "🪚", "🐕", "🐈", "🚶🏼‍♀️", "🎉", "🏓", "💻", "🌓", "🌽", "💀", "🏝", "🐑", "🪐", "🧩"]
    @State var emojiCount = 14

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .padding()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                getThemeButton(theme: "car", text: "Vehicles")
                Spacer()
                getThemeButton(theme: "tshirt", text: "Clothes")
                Spacer()
                getThemeButton(theme: "calendar", text: "Decor")
            }
            .font(.largeTitle)
            .padding()
        }
        .padding(.horizontal)
    }
    
    func changeTheme(theme: String) {
        print("changing theme")
    }
    
    func getThemeButton(theme: String, text: String) -> some View {
        Button {
            changeTheme(theme: theme)
        } label: {
            VStack {
                Image(systemName: theme)
                Text(text)
                    .font(.system(size: 12, weight: .light))
            }

        }
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
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
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
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
    }
}
