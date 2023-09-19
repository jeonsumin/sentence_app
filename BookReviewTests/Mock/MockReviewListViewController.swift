//
//  MockReviewListViewController.swift
//  BookReviewTests
//
//  Created by terry on 2023/09/19.
//

import Foundation
@testable import BookReview

final class MockReviewListViewController: ReviewListProtocal {
    var isCalledSetupNavigationbar = false
    var isCalledSetupViews = false
    var isCalledPresentToReviewWriteViewController = false
    var isCalledReloadTableView = false
    func setupNavigationBar() {
        isCalledSetupNavigationbar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToReviewWriteViewController() {
        isCalledPresentToReviewWriteViewController = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    
}
