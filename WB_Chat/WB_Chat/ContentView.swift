//
//  ContentView.swift
//  WB_Chat
//
//  Created by Илья Десятов on 16.08.2024.
//

import SwiftUI
import ExyteChat

struct ContentView: View {
    var body: some View {
          var replyMessage: Message { Message (
           id: "a1",
           user: .init(
               id: "1234567",
               name: "Вы",
               avatarURL: nil,
               isCurrentUser: true
           ),
           status: .read,
           text: "Купил гадзиллу?"
       )
       }

         var simpleMessage: Message { Message (
           id: "a2",
           user: .init(
               id: "1234567",
               name: "Вы",
               avatarURL: nil,
               isCurrentUser: true
           ),
           status: .read,
           text: "Годзилла топчик, позже запишу голосом"
       )
       }

       @State var messages: [Message] = [
           replyMessage,
           .init(
               id: "b1",
               user: .init(
                   id: "78910",
                   name: "friend111",
                   avatarURL: URL(string: "https://v-kurse.ru/wp-content/uploads/2021/09/scale_1200-2-3.jpg")!,
                   isCurrentUser: false
               ),
               status: .read,
               text: "Cмотри че генерится :)",
               attachments: [
                   .init(
                       id: "1.1",
                       url: URL(string: "https://img.razrisyika.ru/kart/121/1200/483203-s-godzilloy-35.jpg")!,
                       type: .image
                   )
               ]
           ),
               .init(
                   id: "b2",
                   user: .init(
                       id: "78910",
                       name: "friend111",
                       avatarURL: URL(string: "https://v-kurse.ru/wp-content/uploads/2021/09/scale_1200-2-3.jpg")!,
                       isCurrentUser: false
                   ),
                   status: .read,
                   text: "Кайфы, как тебе?",
                   replyMessage: replyMessage.toReplyMessage()
               ),
           simpleMessage,
           .init(
               id: "a3",
               user: .init(
                   id: "1234567",
                   name: "Вы",
                   avatarURL: nil,
                   isCurrentUser: true
               ),
               status: .read,
               recording: .init(
                duration: 21,
                waveformSamples: [
                    0.1,
                    0.4,
                    0.5,
                    0.3,
                    0.6,
                    0.3,
                    0.4,
                    0.2,
                    0.8,
                    0.1,
                    0.4,
                    0.5,
                    0.4,
                    0.8,
                    0.4
                ]
               )
           ),
           .init(
               id: "b3",
               user: .init(
                   id: "78910",
                   name: "friend111",
                   avatarURL: URL(string: "https://v-kurse.ru/wp-content/uploads/2021/09/scale_1200-2-3.jpg")!,
                   isCurrentUser: false
               ),
               status: .read,
               text: "че каво?"
           )
       ]
        
        NavigationView {
            VStack {
                ChatView(messages: messages) { draft in
                    print("")
                }
            inputViewBuilder: { textBinding, attachments, inputViewState, inputViewStyle, inputViewActionClosure, dismissKeyboardClosure in
                Group {
                    switch inputViewStyle {
                    case .message: // input view on chat screen
                        VStack {
                            HStack(spacing: 12) {
                                attachmentView { inputViewActionClosure(.photo) }
                                TextField("Write your message", text: textBinding)
                                    .frame(height: 36)
                                    .padding(.horizontal, 8)
                                    .background(.backText)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                sendView { inputViewActionClosure(.send) }
                            }
                            .padding()
                        }
                    case .signature: // input view on photo selection screen
                        VStack {
                            HStack {
                                Button("Send") { inputViewActionClosure(.send) }
                            }
                            TextField("Compose a signature for photo", text: textBinding)
                                .background(Color.green)
                        }
                    }
                }
            }
            .chatTheme(
                .init(
                    colors: .init(
                        myMessage: .lightPurple,
                        myMessageTime: .white
                    )
                )
            )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 0) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(.searchIcon)
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(.burgerMenu)
                        })
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 0) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(.chevron)
                        })
                        Text("Анастасия И.")
                            .font(.system(size: 18, weight: .semibold))
                            .bold()
                            .foregroundStyle(.darkPurple)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
