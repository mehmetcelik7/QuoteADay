//
//  SelectFontView.swift
//  QuoteADay
//
//  Created by mehmet Çelik on 25.03.2025.
//

import SwiftUI

struct SelectFontView: View {
    let fontList: [String] = [
        "Courier New", "Pacifico-Regular", "Molle-Regular", "GreatVibes-Regular",
        "Sacramento-Regular", "DancingScript-SemiBold", "ButterflyKids-Regular",
        "GoblinOne", "ChalkboardSE-Bold", "Limelight-Regular", "ShadowsIntoLightTwo-Regular"
    ]
    
    let text: String
   
    let textFontSizeConst : CGFloat = 24
    @State var  chosenFont: String
    
    @State private var color: [Color] = [.red,.yellow]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(fontList, id: \.self) { font in
                    Text(text)
                        .font(Font.custom(font, size: font == chosenFont ? 1.5 * textFontSizeConst :  textFontSizeConst))
                        .padding(.horizontal)
                        .animation(.spring(),value: chosenFont)
                        .onTapGesture {
                            chosenFont = font
                            color = randomColor()
                        }
                }
            }.padding()
                .background(LinearGradient(colors: color, startPoint: .topTrailing, endPoint: .bottomLeading))
        }
    }
    func randomColor() -> [Color] {
        let colorList: [Color] = [.red,.yellow,.blue,.purple,.gray,.white]
      
       
        return colorList.shuffled()
    }
}

#Preview {
    SelectFontView(text: "İCARDİ", chosenFont: "Courier New")
}
