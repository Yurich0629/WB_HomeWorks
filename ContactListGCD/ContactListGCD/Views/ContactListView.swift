//
//  ContactsListView.swift
//  ContactListGCD
//
//  Created by Илья Десятов on 7.08.2024.
//

import SwiftUI

struct ContactsListView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 14) {
                    headerView
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(Contact.mockData) { contact in
                            NavigationLink(destination: ProfileView(profile: contact.toProfile())) {
                                ContactRowView(contact: contact)
                                Divider()
                            }
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
                }
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            Text("Контакты")
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "plus")
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ContactsListView()
}

