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
    var fontSize: CGFloat = 30
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
                                .padding()
                            .minimumScaleFactor(0.1)
                        )
                        .padding()
                }
                Spacer()
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

I wander the path where flowers bloom,
In silent hush and twilight gloom.
The sky, once pale, turns gold at noon,
As fate aligns with fortune soon.

In hidden valleys, I roam alone,
Searching for truths I’ve never known.
A traveler’s heart beats wild and free,
Yearning for what the soul can see.

Mountains tower, proud and high,
Their echoes dancing with the sky.
Each ridge a story, carved by time,
Etched in stone with quiet rhyme.

At dusk, the heavens flame in red,
Thoughts of yesterdays fill my head.
Stars emerge, uncounted, bright—
Lanterns guiding the wandering night.
""", author: "Joel Randymar")
}
