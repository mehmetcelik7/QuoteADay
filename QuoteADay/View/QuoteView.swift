//
//  ContentView.swift
//  QuoteADay
//
//  Created by mehmet Çelik on 25.03.2025.
//

import SwiftUI

struct QuoteView: View {
    @State private var quote: String = "Temp quote"
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                
                BigTextView(text: "Quote of the Day")
                Spacer()
                BigTextView(text: quote)
                Spacer()
                BorderedNormalTextView(text: "Tap for Quote")
                    .onTapGesture {
                        quote = "Life is not about having everything. It is about cherishing the moments and appreciating the little things."
                    }
            }
            .padding()
        }
    }
}

#Preview {
    QuoteView()
}
