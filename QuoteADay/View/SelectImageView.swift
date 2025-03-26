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
    var fontSize: CGFloat = 30

    @State private var chosenFont: String = "Courier New"
    @State private var textOpacity: CGFloat = 1.0
    @State private var textScale: CGFloat = 1.0
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
           
            
            VStack {
                Spacer()
                ZStack {
                    Image(img1)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white,lineWidth: 3)
                        )
                        .overlay(
                            CustomNormalTextView(text: quote, chosenFont: chosenFont, fontSize: fontSize)
                                .opacity(textOpacity)
                                .padding()
                            .minimumScaleFactor(0.1)
                        )
                        .padding()
                }
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    Text("Text Opacity")
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                        .italic()
                    Slider(value: $textOpacity, in: 0.0...1.0,step: 0.02)
                }.padding()
                SelectFontView(text: "İcardi", chosenFont: $chosenFont)
            }
          
 
            
           
              
               

            
        }
    }
}

#Preview {
    SelectImageView(quote: """
The dawn breaks soft with silver hue,
Carving shadows across the dew.
A restless breeze stirs ancient trees,
Whispering secrets no mortal sees.

""", author: "Joel Randymar")
}
