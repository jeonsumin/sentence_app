//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import UIKit

protocol ReviewListProtocal {
    func setupNavigationBar()
    func setupViews()
}

final class ReviewListPresenter:NSObject {
    private let viewController: ReviewListProtocal
    
    init(viewController: ReviewListProtocal) {
        self.viewController = viewController
    }
    
    func viewDidLoad(){
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
    
    
}
