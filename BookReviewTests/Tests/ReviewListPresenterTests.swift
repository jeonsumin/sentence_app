//
//  ReviewListPresenterTests.swift
//  ReviewListPresenterTests
//
//  Created by terry on 2023/09/18.
//

import XCTest
@testable import BookReview

final class ReviewListPresenterTests: XCTestCase {
    
    var sut: ReviewListPresenter! // 실코드에서는 ?를 사용하지만 테스트에서는 !를 사용하는것이 테스트할때 직접적으로 에러를 확인 할 수 있으므로 좋음
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        sut = ReviewListPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewWillAppear가_호출될때 (){
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
    
    func test_viewDidLoad가_호출될때 (){
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationbar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_didTapRightBarButtonItem이_호출될때(){
        sut.didTapRightBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledPresentToReviewWriteViewController)
    }
}
