//
//  ReviewListBookController.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import UIKit
import SnapKit

final class ReviewListBookController: UIViewController {
    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension ReviewListBookController: ReviewListProtocal {
    func setupNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                 target: self,
                                                 action: nil)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
}
