//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import UIKit

protocol SearchBookProtocol {
    func setupViews()
    func dismiss()
}

class SearchBookPresenter:NSObject {
    private let viewController: SearchBookProtocol
    
    init(viewController: SearchBookProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad(){
        viewController.setupViews()
    }
}

//MARK: - UISearchBarDelegate
extension SearchBookPresenter: UISearchBarDelegate {}

//MARK: - UITableViewDelegate
extension SearchBookPresenter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.dismiss()
    }
}

//MARK: - UITableViewDataSource
extension SearchBookPresenter: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}

