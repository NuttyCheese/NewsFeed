//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import Foundation

class NetworkManager {
    
    let shared = NetworkManager()
    
    static func fetchNewsFeed(url: String) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let newsFeedNetwork = try JSONDecoder().decode(NewsFeedNetwork.self, from: data)
                print(newsFeedNetwork)
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    init() {}
}
