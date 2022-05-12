//
//  Network.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import Foundation

struct Network: Decodable {
    let author: String
    let title: String
    let urlToImage: String
    let content: String
    
    static func fetchNewsFeed(url: String) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let newsFeedNetwork = try JSONDecoder().decode([NewsFeedNetwork].self, from: data)
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
 
struct NewsFeedNetwork: Decodable {
    let articles: [Network]
}
