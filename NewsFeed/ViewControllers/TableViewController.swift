//
//  TableViewController.swift
//  NewsFeed
//
//  Created by Борис Павлов on 17.05.2022.
//

import UIKit

enum ListButtons: String, CaseIterable {
    case newsFeed = "News Feed"
    case parseJSON = "parseJSON"
}

class TableViewController: UITableViewController {

    private let listButtons = ListButtons.allCases

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listButtons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let button = listButtons[indexPath.row].rawValue
        
        content.text = button
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = listButtons[indexPath.row]
        
        switch list {
        case .newsFeed: performSegue(withIdentifier: "showNewsFeed", sender: nil)
        case .parseJSON: performSegue(withIdentifier: "showParseJSON", sender: nil)
        }
    }
}
