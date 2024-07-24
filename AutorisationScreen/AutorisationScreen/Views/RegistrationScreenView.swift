//
//  RegistrationScreenView.swift
//  AutorisationScreen
//
//  Created by Илья Десятов on 16.07.2024.
//

import SwiftUI

struct RegistrationScreenView: View {
    
    @State var contact: PhoneNumberModel
    
    var body: some View {
        VStack {
            Text("Введите номер телефона")
                .frame(width: 293, height: 29)
                .font(.title2)
                .foregroundStyle(.darkPurple)
                .bold()
                .padding(.top, 80)
                .multilineTextAlignment(.center)
            
            Text("Мы вышлем код подтверждения на указанный номер")
                .frame(width: 293, height: 48)
                .foregroundStyle(.darkPurple)
                .multilineTextAlignment(.center)
            
            HStack {
                HStack {
                    Image("flag")
                    Text("+7")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.grayForField)
                )
                
                HStack {
                    TextField("", text: $contact.phoneNumber, prompt: Text("000 000-00-00"))
                        .font(.system(size: 14))
                        .bold()
                        .frame(width: 262, height: 36)
                        .keyboardType(.numberPad)
                        .foregroundStyle(.black)
                        .padding(.leading)
                        .onChange(of: contact.phoneNumber) { newValue in
                            if newValue.count > 11 {
                                contact.phoneNumber = String(newValue.prefix(11))
                            }
                        }
                }
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.grayForField)
                )
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
            }
            .padding(.top, 49)
            
            Spacer()
            
            Button {
                hideKeyboard()
            } label: {
                Text("Продолжить")
                    .fontWeight(.bold)
                    .frame(width: 327, height: 52)
                    .background(Color.lightPurple)
                    .foregroundStyle(.whiteForText)
                    .opacity(0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .padding(24)
            }
        }
        .padding()
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    RegistrationScreenView(contact: PhoneNumberModel(phoneNumber: ""))
}
