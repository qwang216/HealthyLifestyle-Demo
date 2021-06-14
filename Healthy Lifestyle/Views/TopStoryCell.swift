//
//  TopStoryCell.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/14/21.
//

import UIKit

class TopStoryCell: UITableViewCell {
    static let identifier = "TopStoryCell"

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!

    var imageDataTask: URLSessionDataTask?

    override func prepareForReuse() {
        super.prepareForReuse()
        imageDataTask?.cancel()
    }

    func configCell(_ viewModel: TopStoryCellViewModel) {
        articleTitleLabel.text = viewModel.title
        authorLabel.text = viewModel.author
        publishDateLabel.text = viewModel.formattedPublishedDate
        abstractLabel.text = viewModel.abstract
        imageDataTask = articleImageView.fetchImage(url: viewModel.imageURLString ?? "", indicator: activityIndicator)
        imageDataTask?.resume()
    }
}
