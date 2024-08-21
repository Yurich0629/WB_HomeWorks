//
//  ExtContentView.swift
//  WB_Chat
//
//  Created by Илья Десятов on 16.08.2024.
//
import SwiftUI

extension ContentView {
    //attachment button image
    private var attachmentImage: some View {
        Image(.attachment)
    }
    
    @ViewBuilder func attachmentView(action: @escaping () -> Void) -> some View {
        Button(action: { action() }, label: {
            attachmentImage
        })
    }
    
    //send button image
    
    private var sendImage: some View {
        Image(.sender)
    }
    
    @ViewBuilder func sendView(action: @escaping () -> Void) -> some View {
        Button(action: { action() }, label: {
            sendImage
        })
    }
}
