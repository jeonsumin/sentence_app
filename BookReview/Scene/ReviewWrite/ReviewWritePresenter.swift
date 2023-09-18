//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import Foundation

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertSheet()
    func close()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageUrl: URL?)
}
final class ReviewWritePresenter{
    private let viewController: ReviewWriteProtocol
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad(){
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton(){
        viewController.showCloseAlertSheet()
    }
    
    func didTapRightBarButton(){
        //TODO: UserDefault에 유저가 작성한 도서리뷰를 저장하기
        viewController.close()
    }
    
    func didTapBookTitleButton(){
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter:SearchBookDelegate {
    func selectBook(_ book: Book) {
        viewController.updateViews(title: book.title, imageUrl: book.imageUrl)
    }    
}
