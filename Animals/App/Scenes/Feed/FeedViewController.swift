//
//  FeedViewController.swift
//  Animals
//
//  Created by Diggo Silva on 15/10/24.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
        view.backgroundColor = .white
    }
    
    private func setNavBar() {
        title = "Animais"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
    
    private func setDelegatesAndDataSources() {
        
    }
}
