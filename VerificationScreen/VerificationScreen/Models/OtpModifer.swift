//
//  OtpModifer.swift
//  VerificationScreen
//
//  Created by Илья Десятов on 16.07.2024.
//

import SwiftUI
import Combine

struct OtpModifer: ViewModifier {

    @Binding var pin : String

    var textLimt = 1

    func limitText(_ upper : Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }


    //MARK -> BODY
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) {_ in limitText(textLimt)}
            .frame(width: 45, height: 45)
            .background(Color.white.cornerRadius(5))
            .clipShape(Circle())
            .background(
                Circle()
                    .stroke(Color("blueColor"), lineWidth: 2)
            )
    }
}
