//
//  ContentView.swift
//  Memories on Map
//
//  Created by SeongBin Park on 7/7/24.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .relativeBottom(0.125)
    @State var searchText: String = ""
        
        let backgroundColors: [Color] = [Color(red: 0.28, green: 0.28, blue: 0.53), Color(red: 1, green: 0.69, blue: 0.26)]
        let words: [String] = ["birthday", "pancake", "expansion", "brick", "bushes", "coal", "calendar", "home", "pig", "bath", "reading", "cellar", "knot", "year", "ink"]
        
    var filteredWords: [String] {
        self.words.filter({ $0.contains(self.searchText.lowercased()) || self.searchText.isEmpty })
    }
    
    var body: some View {
        MapView()
            .bottomSheet(bottomSheetPosition: self.$bottomSheetPosition, switchablePositions: [
                .relativeBottom(0.125),
                .relative(0.4),
                .relativeTop(0.975)
            ], headerContent: {
                //A SearchBar as headerContent.
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("지도 검색", text: self.$searchText)
                }
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
                    .padding([.horizontal, .bottom])
                    //When you tap the SearchBar, the BottomSheet moves to the .top position to make room for the keyboard.
                    .onTapGesture {
                        self.bottomSheetPosition = .relativeTop(0.975)
                    }
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                    .padding(.vertical, 5)
                    .padding(.trailing, 14)
            }) {
                //The list of nouns that will be filtered by the searchText.
                ForEach(self.filteredWords, id: \.self) { word in
                    Text(word)
                        .font(.title)
                        .padding([.leading, .bottom])
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .transition(.opacity)
                .animation(.easeInOut, value: self.filteredWords)
                .padding(.top)
            }
            .enableAppleScrollBehavior()
            //.enableBackgroundBlur()
            .backgroundBlurMaterial(.systemDark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
