//
//  BookReview.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import Foundation

struct BookReview: Codable {
    let title: String
    let contents: String
    let imageURL: URL?
}
