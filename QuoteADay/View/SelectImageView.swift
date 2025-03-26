//
//  SelectImageView.swift
//  QuoteADay
//
//  Created by mehmet Çelik on 25.03.2025.
//

import SwiftUI

struct SelectImageView: View {
    let quote: String
    let author: String
    @State private var chosenFont: String = "Courier New"
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Image(img1)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white,lineWidth: 3)
                    )
                    .padding()
                NormalTextView(text: quote)
            }
            SelectFontView(text: "İcardi", chosenFont: $chosenFont)
 
            
           
              
               

            
        }
    }
}

#Preview {
    SelectImageView(quote: "Life is not about having everything. It's about finding meaning in everything", author: "Joel Randymar")
}
