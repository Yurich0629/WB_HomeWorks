//
//  OtpModifer.swift
//  VerificationScreen
//
//  Created by Илья Десятов on 16.07.2024.
//

import SwiftUI

struct OtpFormFieldView: View {
    //MARK -> PROPERTIES
    
    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour
    }
    
    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    
    
    //MARK -> BODY
    var body: some View {
        VStack {
            
            Text("Введите код")
                .frame(width: 293, height: 29)
                .multilineTextAlignment(.center)
                .font(.title)
                .foregroundStyle(.darkPurple)
                .bold()
                .padding(.top, 80)
            
            Text("Отправили код на номер \n +7 999 999-99-99")
                .frame(width: 293, height: 48)
                .multilineTextAlignment(.center)
                .foregroundStyle(.darkPurple)
                .padding(.top, 8)
                .padding(.bottom, 49)
            
            HStack(spacing: 44, content: {
                
                TextField("", text: $pinOne)
                    .frame(maxWidth: 24, maxHeight: 24)
                    .background(.code)
                    .clipShape(Circle())
                    .modifier(OtpModifer(pin:$pinOne))
                    .onChange(of:pinOne) {newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinTwo
                        }
                    }
                    .focused($pinFocusState, equals: .pinOne)
                
                TextField("", text: $pinTwo)
                    .frame(maxWidth: 24, maxHeight: 24)
                    .background(.code)
                    .clipShape(Circle())
                    .modifier(OtpModifer(pin:$pinTwo))
                    
                    .onChange(of:pinTwo) {newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinThree
                        } else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinOne
                            }
                        }
                    }
                    .focused($pinFocusState, equals: .pinTwo)
                
                TextField("", text: $pinThree)
                    .frame(maxWidth: 24, maxHeight: 24)
                    .background(.code)
                    .clipShape(Circle())
                    .modifier(OtpModifer(pin:$pinThree))
                    .onChange(of:pinThree) {newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinFour
                        } else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinTwo
                            }
                        }
                    }
                    .focused($pinFocusState, equals: .pinThree)
                
                TextField("", text: $pinFour)
                    .frame(maxWidth: 24, maxHeight: 24)
                    .background(.code)
                    .clipShape(Circle())
                    .modifier(OtpModifer(pin:$pinFour))
                    .onChange(of:pinFour) {newVal in
                        if (newVal.count == 0) {
                            pinFocusState = .pinThree
                        }
                    }
                    .focused($pinFocusState, equals: .pinFour)
            })
            .padding(.bottom, 69)
            
            Button {
                hideKeyboard()
            } label: {
                Spacer()
                Text("Запросить код повторно")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.lightPurple)
                Spacer()
            }
            .padding()
        }
    }
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct OtpFormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OtpFormFieldView()
    }
}
