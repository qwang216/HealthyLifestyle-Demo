//
//  LifestyleListView.swift
//  Healthy Lifestyle
//
//  Created by Jason wang on 6/12/21.
//

import UIKit

class LifestyleListView: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var topStoryViewModels = [TopStoryCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        getData(.Health)
    }

    func getData(_ category: TopStoryCategory) {
        title = category.rawValue
        activityIndicator.startAnimating()
        NYTNetworkService.getTopStories(category: category) { [weak self] result in
            switch result {
            case .success(let data):
                data.forEach {
                    let vm = TopStoryCellViewModel(topstory: $0)
                    self?.topStoryViewModels.append(vm)
                }
                self?.tableview.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
            self?.activityIndicator.stopAnimating()
        }
    }
}

extension LifestyleListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStoryViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: TopStoryCell.identifier, for: indexPath) as! TopStoryCell
        cell.configCell(topStoryViewModels[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        let selectedStory = topStoryViewModels[indexPath.row]
        let webView = HLWebViewController.viewController(vm: selectedStory)
        navigationController?.pushViewController(webView, animated: true)
    }

}
