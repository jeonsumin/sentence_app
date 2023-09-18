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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
}

extension ReviewListBookController: ReviewListProtocal {
    func setupNavigationBar() {
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                 target: self,
                                                 action: #selector(didTapRightBarButtonItem))
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func presentToReviewWriteViewController(){
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func reloadTableView(){
        tableView.reloadData()
        print("최신 도서리뷰 목록 보여주기")
    }
}

private extension ReviewListBookController {
    @objc func didTapRightBarButtonItem(){
        presenter.didTapRightBarButtonItem()
    }
}
