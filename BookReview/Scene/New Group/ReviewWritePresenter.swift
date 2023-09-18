//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import Foundation

protocol ReviewWriteProtocol {
    
}
final class ReviewWritePresenter{
    private let viewController: ReviewWriteProtocol
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
}
