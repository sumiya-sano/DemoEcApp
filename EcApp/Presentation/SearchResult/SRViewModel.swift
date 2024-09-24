//
//  SRViewModel.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/24.
//

import Foundation

class SRViewModel: ObservableObject {
    @Published var products: [Product] = []
    private let searchUsecase = SearchUsecase()
    
    func searchProducts(query: String) {
        searchUsecase.search(query: query) { [weak self] products in
            DispatchQueue.main.async {
                self?.products = products // UIスレッドで更新
            }
        }
    }
}
