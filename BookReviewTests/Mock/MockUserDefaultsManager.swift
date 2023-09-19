//
//  MockUserDefaultsManager.swift
//  BookReviewTests
//
//  Created by terry on 2023/09/19.
//

import Foundation
@testable import BookReview


final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReviews = false
    var isCalledSetReviews = false
    func getReviews() -> [BookReview] {
        isCalledGetReviews = true
        return []
    }
    
    func setReviews(_ newValue: BookReview) {
        isCalledSetReviews = true
    }
    
    
}

