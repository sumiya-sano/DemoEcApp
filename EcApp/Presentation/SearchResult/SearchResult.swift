//
//  SearchResult.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/22.
//

import SwiftUI

struct SearchResult: View {
    @State private var products: [Product] = []
    
    var body: some View {
        NavigationStack {
            List(products) { product in
                ProductView(product: product)
            }
            .onAppear {
                loadProducts() // 商品をロード
            }
        }
    }
    
    // 商品データの読み込み（モックデータ）
    private func loadProducts() {
        SearchApi.searchProducts(query: "") { loadedProducts in
            self.products = loadedProducts
        }
    }
}

struct ProductView: View {
    let product: Product
    
    var body: some View {
        NavigationLink(destination: ProductDetail(imageUrl: product.productImage, productName: product.productName, productPrice: product.productPrice.price)) {
            HStack(alignment: .top) {
                AsyncImage(url: product.productImage) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 150, height: 215)
                    case .failure(_):
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 150, height: 215)
                    case .empty:
                        ProgressView()
                            .frame(width: 150, height: 215)
                    @unknown default:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 150, height: 215)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                
                VStack(alignment: .leading) {
                    Text(product.productName)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(product.productPrice.price)
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
