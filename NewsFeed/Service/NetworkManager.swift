//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    let shared = NetworkManager()
    
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
    
    init() {}
}
