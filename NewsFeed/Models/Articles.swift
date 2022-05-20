//
//  Articles.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import Foundation
import UIKit

enum Link: String {
    case newsFeedURL = "https://newsapi.org/v2/everything?q=tesla&from=2022-04-20&sortBy=publishedAt&apiKey=780c3cabfb5f4692b033a5a8e9c47865"
    case postRequest = "https://jsonplaceholder.typicode.com/posts"
}

struct Articles: Decodable {
    let author: String?
    let title: String?
    let urlToImage: String?
    let content: String?
}
 
struct NewsFeedNetwork: Decodable {
    let articles: [Articles]?
}
