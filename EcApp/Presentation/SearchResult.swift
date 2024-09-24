//
//  SearchResult.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/22.
//

import SwiftUI

struct SearchResult: View {
    var body: some View {
        NavigationStack{
            VStack{
                Product(imageUrl: URL(string: "https://prcdn.freetls.fastly.net/release_image/38608/20/38608-20-c2c756b340c6fcfd69b798f1fe8621a9-2048x2048.jpg?format=jpeg&auto=webp&quality=85%2C65&width=1950&height=1350&fit=bounds")!,productName: "ねこ",productPrice: "500")
                Product(imageUrl: URL(string: "https://example.com/image.png")!,productName: "三角",productPrice: "20")
            }
        }
    }
}

struct Product: View {
    let imageUrl: URL
    let productName: String
    let productPrice: String
    
    var body: some View {
        NavigationLink(destination: ProductDetail(imageUrl:  URL(string: "$imageUrl")!, productName: productName, productPrice: productPrice)){
            HStack(alignment: .top){
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
                
                VStack(alignment: .leading) {
                    Text(productName)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(productPrice + "円")
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    SearchResult()
}
