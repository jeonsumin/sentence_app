//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import UIKit
import Kingfisher

protocol ReviewListProtocal {
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class ReviewListPresenter:NSObject {
    private let viewController: ReviewListProtocal
    private let userDefaultsManager = UserDefaultsManager()
    private var review: [BookReview] = []
    
    init(viewController: ReviewListProtocal) {
        self.viewController = viewController
    }
    
    func viewDidLoad(){
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    
    func viewWillAppear(){
        //TODO: UserDefaults 내용 업데이트 하기
        review = userDefaultsManager.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem(){
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(with: review.imageURL,completionHandler: { _ in
            cell.setNeedsLayout()
        })
        cell.selectionStyle = .none
        return cell
    }
    
    
}
