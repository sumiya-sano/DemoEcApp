//
//  SearchUsecase.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/24.
//

import Foundation
class SearchUsecase {
    func search(query: String, completion: @escaping ([Product]) -> Void) {
        SearchApi.searchProducts(query: query) { products in
            completion(products) 
        }
    }
}
