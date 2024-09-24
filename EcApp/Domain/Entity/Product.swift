//
//  Product.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/24.
//

import Foundation

//Codableはエンコードやデコードするプロトコル。APIレスポンスがJson想定なのでつけとく。
struct Product: Identifiable, Codable {
    let id = UUID()
    let productImage: URL
    let productName: String
    let productPrice: Price
}
