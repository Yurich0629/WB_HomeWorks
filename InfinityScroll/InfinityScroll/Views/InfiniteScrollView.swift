//
//  InfiniteScrollView.swift
//  InfinityScroll
//
//  Created by Илья Десятов on 09.07.2024.
//

import SwiftUI

struct InfiniteScrollView: View {
    @State private var items = Array(0..<20)
    @State private var isLoading = false

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items, id: \.self) { item in
                    EmojiCellModel()
                        .onAppear {
                            if item == items.last {
                                loadMoreItems()
                            }
                        }
                }
                if isLoading {
                    ProgressView()
                }
            }
        }
    }

    private func loadMoreItems() {
        guard !isLoading else { return }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let newItems = items.count..<(items.count + 20)
            items.append(contentsOf: newItems)
            isLoading = false
        }
    }
}

#Preview {
    InfiniteScrollView()
}
