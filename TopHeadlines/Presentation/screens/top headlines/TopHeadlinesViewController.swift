//
//  TopHeadlinesViewController.swift
//  TopHeadlines
//
//  Created by waheedCodes on 19/08/2022.
//

import UIKit

class TopHeadlinesViewController: UITableViewController {

    var viewModel: TopHeadlinesViewModel?

    // MARK: - Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top Headlines"
        loadTopHeadlines()
    }

    private func loadTopHeadlines()  {
        if let viewModel = viewModel {
            Task {
                await viewModel.loadTopHeadlines()
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsIn(section: section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TopHeadlineCell = tableView.dequeue(for: indexPath)
        if let headline = viewModel?.cellForRowAt(indexPath: indexPath) {
            cell.configure(with: headline)
        }
        
        return cell
    }
}
