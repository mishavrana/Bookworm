//
//  RatingView.swift
//  Bookworm
//
//  Created by Misha Vrana on 15.05.2023.
//

import SwiftUI

struct RaitingView: View {
    @Binding var raiting: Int
    
    var label = ""
    var maximumRaiting = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
//    func image(for number: Int) -> Image {
//        if number > raiting {
//            return offImage ?? onImage
//        } else {
//            return onImage
//        }
//    }
    func image(for number: Int) -> some View {
        let isSelected = number <= raiting
        let image = isSelected ? onImage : offImage ?? onImage
        let color = isSelected ? onColor : offColor
        return image
            .aspectRatio(contentMode: .fit)
            .foregroundColor(color)
            .onTapGesture {
                raiting = number == 1 ? number - 1 : number
            }
    }
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRaiting + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > raiting ? offColor : onColor)
            }
        }
    }
}

struct RaitingView_Previews: PreviewProvider {
    static var previews: some View {
        RaitingView(raiting: .constant(1))
    }
}
