//
//  TextViews.swift
//  QuoteADay
//
//  Created by mehmet Çelik on 25.03.2025.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

struct BigTextView: View {
   
    
    let text: String
    let widthProportion: CGFloat = 0.8333333
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: screenWidth * widthProportion)
    }
}
struct NormalTextView: View {
   
    
    let text: String
    let widthProportion: CGFloat = 0.8333333
    
    var body: some View {
        Text(text)
           
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: screenWidth * widthProportion)
    }
}
struct CustomNormalTextView: View {
    let text: String
    let chosenFont: String
    var fontSize: CGFloat = 15
    
    let widthProportion: CGFloat = 0.8333333
    
    var body: some View {
        Text(text)
            .font(Font.custom(chosenFont, size: fontSize))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: screenWidth * widthProportion)
    }
}

struct BorderedBigTextView: View {
   
    
    let text: String
    let widthProportion: CGFloat = 0.8333333
    var lineWidth: CGFloat = 2
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: screenWidth * widthProportion)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.white, lineWidth: lineWidth)
            )
    }
}
struct BorderedNormalTextView: View {
   
    
    let text: String
    let widthProportion: CGFloat = 0.8333333
    var lineWidth: CGFloat = 2
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        Text(text)
           
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
//            .frame(width: screenWidth * widthProportion)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.white, lineWidth: lineWidth)
            )
    }
}



#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            
            BigTextView(text: "Life is not about having everything. It's about finding meaning in everything.")
            NormalTextView(text: "Welcome to your daily dose of inspiration")
            BorderedBigTextView(text: "99")
            BorderedNormalTextView(text: "icardi")
        }
    }
}
