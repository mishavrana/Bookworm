//
//  EmojiRaitingView.swift
//  Bookworm
//
//  Created by Misha Vrana on 15.05.2023.
//

import SwiftUI

struct EmojiRaitingView: View {
    let raiting: Int16
    var body: some View {
        switch raiting {
        case 1:
            return Text("🥱")
        case 2:
            return Text("🫢")
        case 3:
            return Text("😒")
        case 4:
            return Text("🥰")
        default:
            return Text("🤯")
        }
    }
}

struct EmojiRaitingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRaitingView(raiting: 3)
    }
}
