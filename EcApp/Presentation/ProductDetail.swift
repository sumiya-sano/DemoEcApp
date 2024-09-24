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
            Text(productName)
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 150,height: 215)
                case .failure(_):
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 150,height: 215)
                case .empty:
                    ProgressView()
                        .frame(width: 150,height: 215)
                @unknown default:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 150,height: 215)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            Text(productPrice)
        }
    }
}

#Preview {
    ProductDetail(imageUrl:  URL(string: "https://user0514.cdnw.net/shared/img/thumb/tdog17030723_TP_V.jpg")!, productName: "わんこ", productPrice: "50000円")
}
