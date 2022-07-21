//
//  SearchBar.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//
import SwiftUI
import Foundation


struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var action: () -> Void
    var body: some View {
        HStack {
            HStack {
                TextField("Search names here", text: $searchText)
                    .accessibilityIdentifier("movieTextField")
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching {
                        Button(action: { searchText = "" }) {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        }
                    }
                }
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
            )
            .transition(.move(edge: .trailing))
            .animation(.spring())
            if isSearching {
                Button(action: {
                    self.action()
                    isSearching = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Search")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .accessibilityIdentifier("serchButton")
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}
