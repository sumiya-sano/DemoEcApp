//
//  SearchApi.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/24.
//

import Foundation

class SearchApi {
    static func searchProducts(query: String, completion: @escaping ([Product]) -> Void) {
//        API接続した風
        let products = [
            Product(productImage: URL(string: "https://www.nitori-net.jp/ecstatic/image/product/2049120-2035024/2049120-203502401.jpg?ccp=1727186400&imwidth=415&imdensity=1&ts=20240801101245819")!,
                    productName: "N-ジオ",
                    productPrice: Price(price: "59,980")),
            Product(productImage: URL(string: "https://www.nitori-net.jp/ecstatic/image/product/2000915-2000865/2000915-200086501.jpg?ccp=1727186400&imwidth=415&imdensity=1&ts=20240731192240817")!,
                    productName: "バジーナC",
                    productPrice: Price(price: "14,990")),
            Product(productImage: URL(string: "https://www.nitori-net.jp/ecstatic/image/product/5630187/563018701.jpg?ts=20220620065330956&imwidth=200&imdensity=1&zcp=1727186400")!,
                    productName: "シングル 2つ折りヒノキすのこベッド",
                    productPrice: Price(price: "10,990")),
            Product(productImage: URL(string: "https://www.nitori-net.jp/ecstatic/image/product/0000002060820-2110600016375/0000002060820-211060001637501.jpg?ccp=1727186400&imwidth=415&imdensity=1&ts=20240923072509150")!,
                    productName: "電動ベッド(メリッサ3)",
                    productPrice: Price(price: "98,618")),
            Product(productImage: URL(string: "https://www.nitori-net.jp/ecstatic/image/product/2402150/240215001.jpg?ccp=1727186400&imwidth=415&imdensity=1&ts=20231017182603139")!,
                    productName: "2段ベッド(MD23 LBR すのこN)",
                    productPrice: Price(price: "49,990"))
        ]
        
        // completionでデータを返す
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // 非同期っぽい動きのため1秒待機してから返す
            completion(products)
        }
    }
}
