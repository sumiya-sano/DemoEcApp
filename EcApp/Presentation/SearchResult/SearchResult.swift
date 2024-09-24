//
//  SearchResult.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/22.
//

import SwiftUI

struct SearchResult: View {
    @StateObject private var viewModel = SRViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("検索...", text: .constant("")) // 検索バーを作成
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onSubmit {
                        // 検索クエリを使って検索を実行
                        viewModel.searchProducts(query: "猫") // 仮の検索クエリ
                    }
                
                List(viewModel.products) { product in
                    ProductView(product: product)
                }
            }
            .navigationTitle("商品検索")
        }
    }
}

struct ProductView: View {
    let product: Product
    
    var body: some View {
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
            .padding(10)
            
            VStack(alignment: .leading) {
                Text(product.productName)
                    .font(.title)
                    .foregroundColor(.black)
                Text(product.productPrice.price)
                    .font(.title3)
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    SearchResult()
}
