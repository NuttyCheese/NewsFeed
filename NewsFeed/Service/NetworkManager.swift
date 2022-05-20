//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    let shared = NetworkManager()
    
    init() {}
    
    static func fetchNewsFeed(url: String, completion: @escaping ([Articles]) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let newsFeedNetwork = try JSONDecoder().decode(NewsFeedNetwork.self, from: data)
                DispatchQueue.main.async {
                    completion(newsFeedNetwork.articles ?? [])
                }
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    static func postNewsFeed(with data: [String: Any], to url: String, completion: @escaping(Result<Any, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        guard let newsFeedData = try? JSONSerialization.data(withJSONObject: data) else {
            completion(.failure(.noData))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Contet-Type")
        request.httpBody = newsFeedData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            
            do {
                let news = try JSONSerialization.jsonObject(with: data)
                completion(.success(news))
            }catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
