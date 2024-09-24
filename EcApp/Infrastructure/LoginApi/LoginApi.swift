//
//  LoginApi.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/23.
//

import Foundation

class LoginApi {
    static func login(user: User, completion: @escaping (String) -> Void) {
        let url = URL(string: "http://localhost:8080/ecapp/v1/login/200")! // URLはオプショナル型なので強制アンラップ
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // data = レスポンスデータ, response = ヘッダーやステータスコードを含むHTTPレスポンス, error = 通信エラー時にエラー内容が入る
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // エラーが発生した場合
                completion("ログインに失敗しました")
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // 正常にデータを受信した場合
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                completion(responseString)
            } else {
                completion("ログインに失敗しました")
                print("Unknown error occurred.")
            }
        }
        
        task.resume() // タスクを開始
    }
}
