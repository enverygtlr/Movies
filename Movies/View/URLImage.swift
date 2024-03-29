//
//  URLImage.swift
//  Movies
//
//  Created by Enver Yigitler on 27.06.2022.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    @State var data: Data?
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.gray)
        } else {
            Image("no_image").resizable()
            .onAppear {
                fetchData()
            }
        }
    }
    func fetchData() {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
