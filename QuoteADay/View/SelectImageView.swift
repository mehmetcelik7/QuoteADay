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
                                .scaleEffect(textScale)
                            
                                .padding()
                            .minimumScaleFactor(0.1)
                        )
                        .padding()
                }
                Spacer()
                VStack(spacing: 30) {
                    TitledSlider(
                        text: "Text Size",
                        minValue: 0.1,
                        maxValue: 1.3,
                        step: 0.05,
                        value: $textScale
                    )
                    TitledSlider(
                        text: "Text Opacity",
                        minValue: 0.0,
                        maxValue: 1.0,
                        step: 0.02,
                        value: $textOpacity
                    )

                    SelectFontView(text: "İcardi", chosenFont: $chosenFont)
                }.padding(.horizontal)
            }
        }
    }
}

struct TitledSlider: View {
    let text: String
    let minValue: CGFloat
    let maxValue: CGFloat
    let step: CGFloat
    @Binding var value: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .foregroundColor(.white)
                .font(.caption)
                .fontWeight(.bold)
                .italic()
            Slider(value: $value, in: minValue...maxValue,step: step)
        }.padding()
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
