//
//  FeedViewController.swift
//  Animals
//
//  Created by Diggo Silva on 15/10/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedView = FeedView()
    
    override func loadView() {
        super.loadView()
        view = feedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "Animais"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
    
    private func setDelegatesAndDataSources() {
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as! FeedCell
        return cell
    }
}
