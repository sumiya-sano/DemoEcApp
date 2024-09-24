//
//  ProductDetail.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/22.
//

import SwiftUI

struct ProductDetail: View {
    let imageUrl: URL
    let productName: String
    let productPrice: String
    
    var body: some View {
        VStack {
            Text("商品名 " + productName)
                .font(.largeTitle)
                .padding()
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure(_):
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                case .empty:
                    ProgressView()
                @unknown default:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .foregroundColor(.red)
                }
            }
            .frame(width: 150, height: 215)
            .padding()
            Text("価格 " + productPrice)
                .font(.title)
                .padding()
        }
        .navigationTitle("商品詳細")
        .navigationBarTitleDisplayMode(.inline)
    }
}
