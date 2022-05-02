//
//  ContentView.swift
//  Memorize
//
//  Created by Nathan Thomas on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    var cards: [String: [String]] =
            [
                "car": ["🚗", "🚙", "🏎", "🚕", "🚓", "🚘", "🚖", "🚔", "🚋", "🚠"],
                "tshirt": ["🧢", "👙", "🧤", "🧣", "👗", "👚", "🥋", "👖", "🧥", "👕"],
                "calendar": ["🖥", "🪑", "🛋", "🛌", "🍽", "🚪", "🪟", "💡"]
            ]
    
    @State var _theme: String = "car"
    @State var emojiCount = 8

    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
                .padding()
            switch _theme {
            case "car":
                getTheme(theme: _theme)
            case "tshirt":
                getTheme(theme: _theme)
            case "calendar":
                getTheme(theme: _theme)
            default:
                getTheme(theme: "car")
            }
            Spacer()
            HStack {
                getChangeThemeButton(theme: "car", text: "Vehicles")
                Spacer()
                getChangeThemeButton(theme: "tshirt", text: "Clothes")
                Spacer()
                getChangeThemeButton(theme: "calendar", text: "Decor")
            }
            .font(.largeTitle)
            .padding()
        }
        .padding(.horizontal)
    }
    
    func getTheme(theme: String) -> some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                if let selectedTheme = cards[theme] {
                    ForEach(selectedTheme.shuffled()[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
        }
        .foregroundColor(.red)
    }
    
    func getChangeThemeButton(theme: String, text: String) -> some View {
        Button {
            _theme = theme
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
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
