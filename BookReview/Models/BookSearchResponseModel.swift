//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items:[Book] = []
}
