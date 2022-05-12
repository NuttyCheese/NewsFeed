//
//  NewsFeedController.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import UIKit

class NewsFeedController: UITableViewController {

    private var newsFeedArticles: [Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.fetchNewsFeed(url: Link.newsFeedURL.rawValue) { newsFeedArticles in
            self.newsFeedArticles = newsFeedArticles
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedArticles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        let newsModel = newsFeedArticles[indexPath.row]
        
        cell.configure(with: newsModel)
        
        return cell
    }
}
