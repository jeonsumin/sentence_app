//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by terry on 2023/09/19.
//

import XCTest
@testable import BookReview

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultManger: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        viewController = MockReviewWriteViewController()
        userDefaultManger = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(viewController: viewController,userDefaultsManager: userDefaultManger)
    }
    override func tearDown() {
        sut = nil
        viewController = nil
        userDefaultManger = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_호출될때(){
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapLeftBarButton이_호출될때(){
        sut.didTapLeftBarButton()
        XCTAssertTrue(viewController.isCalledShowCloseAlertSheet)
    }
    
    
    
    func test_didTapRightBarButton이_호출될때_Book이_존재하지않으면(){
        sut.book = nil
        sut.didTapRightBarButton(contentsText: "참 공부하기 좋은 책입니다~")
        
        XCTAssertFalse(userDefaultManger.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButton이_호출될때_Book이_존재하고_contentText가_존재하지않으면(){
        sut.book = Book(title: "Swift", imageUrl: "")
        sut.didTapRightBarButton(contentsText: nil)
        
        XCTAssertFalse(userDefaultManger.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButton이_호출될때_Book이_존재하고_contentText가_PlaceHolder와_같으면(){
        sut.book = Book(title: "Swift", imageUrl: "")
        sut.didTapRightBarButton(contentsText: sut.contentsTextViewPlaceHolderText)
        
        XCTAssertFalse(userDefaultManger.isCalledSetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    
    func test_didTapRightBarButton이_호출될때_Book이_존재하고_contentText가_PlaceHolder와_같지않게_존재하면_실행된다(){
        sut.book = Book(title: "Swift", imageUrl: "")
        
        sut.didTapRightBarButton(contentsText: "참 공부하기 좋은 책입니다~")
        
        XCTAssertTrue(userDefaultManger.isCalledSetReviews)
        XCTAssertTrue(viewController.isCalledClose)
    }
    
    func test_didTapBookTitleButton이_호출될때(){
        sut.didTapBookTitleButton()
        
        XCTAssertTrue(viewController.isCalledPresentToSearchBookViewController)
    }
}

final class MockReviewWriteViewController: ReviewWriteProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledShowCloseAlertSheet = false
    var isCalledClose = false
    var isCalledSetupViews = false
    var isCalledPresentToSearchBookViewController = false
    var isCalledupdateView = false

    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func showCloseAlertSheet() {
        isCalledShowCloseAlertSheet = true
    }
    
    func close() {
        isCalledClose = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToSearchBookViewController() {
        isCalledPresentToSearchBookViewController = true
    }
    
    func updateViews(title: String, imageUrl: URL?) {
        isCalledupdateView = true
    }
    
    
}
