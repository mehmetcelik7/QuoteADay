//
//  ContentView.swift
//  QuoteADay
//
//  Created by mehmet Çelik on 25.03.2025.
//

import SwiftUI

struct QuoteView: View {
  
    @StateObject var quoteViewModel: QuoteViewModel = QuoteViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                
                BigTextView(text: "Quote of the Day")
                Spacer()
                BigTextView(text: quoteViewModel.quoteModel.content)
                Spacer()
                BorderedNormalTextView(text: "Tap for Quote")
                    .onTapGesture {
                        quoteViewModel.getRandomQuote()
                    }
            }
            .padding()
        }
    }
}

#Preview {
    QuoteView()
}
