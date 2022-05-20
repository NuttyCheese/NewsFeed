//
//  ParseJSONViewController.swift
//  NewsFeed
//
//  Created by Борис Павлов on 20.05.2022.
//

import UIKit

class ParseJSONViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postRequestWithDict()
    }
    
    private func postRequestWithDict() {
        let newsFeed = [
            "author": "Author News",
            "title": "Title News",
            "urlToImage": "News Image",
            "Content": "Content"
        ]
        
        NetworkManager.postNewsFeed(with: newsFeed, to: Link.postRequest.rawValue) { result in
            switch result {
            case .success(let newsFeed):
                print(newsFeed)
            case .failure(let error):
                print(error)
            }
        }
    }
}
