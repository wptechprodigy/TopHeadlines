//
//  TopHeadlinesViewController.swift
//  TopHeadlines
//
//  Created by waheedCodes on 19/08/2022.
//

import UIKit

class TopHeadlinesViewController: UITableViewController {

    var viewModel: TopHeadlinesViewModel?
    var select: (URL) -> Void = { _ in }

    // MARK: - Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top Headlines"
        refreshIfNeeded()
        loadTopHeadlines()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadTopHeadlines()
    }

    // MARK: - Load top headlines
    
    private func loadTopHeadlines()  {
        if let viewModel = viewModel {
            Task {
                await viewModel.loadTopHeadlines()
                tableView.reloadData()
            }
        }
    }

    // MARK: - Refresh

    private func refreshIfNeeded() {
        self.handleRefresh()

        viewModel?.onTopHeadlinesLoading = { isLoading in
            DispatchQueue.main.async {
                switch isLoading {
                    case true:
                        self.refreshControl?.beginRefreshing()
                    case false:
                        self.refreshControl?.endRefreshing()
                }
            }
        }
    }

    private func handleRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl?
            .addTarget(
                self,
                action: #selector(self.refresh),
                for: .valueChanged)
    }

    @objc private func refresh(_ sender: UIRefreshControl) {
        self.loadTopHeadlines()
    }

    // MARK: - Data source

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

    // MARK: - Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let viewModel = viewModel {
            self.select(viewModel.getHeadlineURL(at: indexPath))
        }
    }
}
