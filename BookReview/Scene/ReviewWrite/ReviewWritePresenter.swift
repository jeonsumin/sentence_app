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
    private let userDefaultManager = UserDefaultsManager()
    private var book: Book?
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요."
    
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
    
    func didTapRightBarButton(contentsText: String?){
        //TODO: UserDefault에 유저가 작성한 도서리뷰를 저장하기
        guard
            let book = book,
            let contentsText = contentsText,
            contentsText != contentsTextViewPlaceHolderText
        else { return }
        
        let bookReview = BookReview(title: book.title, contents: contentsText ?? "" , imageURL: book.imageUrl)
        userDefaultManager.setReviews(bookReview)
        viewController.close()
    }
    
    func didTapBookTitleButton(){
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter:SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageUrl: book.imageUrl)
    }    
}
