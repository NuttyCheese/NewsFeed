//
//  NewsFeedController.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import UIKit

class NewsFeedController: UITableViewController {

    private var newsFeedModel: [Model] = []
    
    private var networkManager = NetworkManager.fetchNewsFeed(url: Link.newsFeedURL.rawValue)
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        let newsModel = newsFeedModel[indexPath.row]
        
        cell.configure(with: newsModel)
        
        return cell
    }
}
