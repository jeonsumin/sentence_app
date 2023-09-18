//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import Foundation

struct BookSearchRequestModel: Codable {
    
    /// 검색할 책 키워드
    let query: String
}
