//
//  NewsCell.swift
//  NewsFeed
//
//  Created by Борис Павлов on 12.05.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configure(with newsFeed: Model) {
        titleLabel.text = newsFeed.title
        authorLabel.text = newsFeed.author
        contentLabel.text = newsFeed.content
        DispatchQueue.global().async {
            guard let url = URL(string: newsFeed.urlToImage ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.newsImageView.image = UIImage(data: imageData)
            }
        }
    }
}
