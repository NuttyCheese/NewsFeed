//
//  Network.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import Foundation

enum Link: String {
    case newsFeedURL = "https://newsapi.org/v2/everything?q=tesla&from=2022-04-12&sortBy=publishedAt&apiKey=780c3cabfb5f4692b033a5a8e9c47865"
}

struct Network: Decodable {
    let author: String
    let title: String
    let urlToImage: String
    let content: String
    
}
 
struct NewsFeedNetwork: Decodable {
    let articles: [Network]
}
