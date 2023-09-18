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
    func reloadView()
}

protocol SearchBookDelegate {
    func selectBook(_ book: Book)
}

class SearchBookPresenter:NSObject {
    private let viewController: SearchBookProtocol
    private let bookSearchManager = BookSearchManager()
    private let delegate: SearchBookDelegate
    
    private var books:[Book] = []
    
    init(viewController: SearchBookProtocol, delegate:SearchBookDelegate) {
        self.viewController = viewController
        self.delegate = delegate
    }
    
    func viewDidLoad(){
        viewController.setupViews()
    }
}

//MARK: - UISearchBarDelegate
extension SearchBookPresenter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        bookSearchManager.request(from: searchText) { [weak self] books in
            self?.books = books
            self?.viewController.reloadView()
        }
    }
}

//MARK: - UITableViewDelegate
extension SearchBookPresenter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.row]
        delegate.selectBook(selectedBook)
        viewController.dismiss()
    }
}

//MARK: - UITableViewDataSource
extension SearchBookPresenter: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = books[indexPath.row].title
        return cell
    }
}

