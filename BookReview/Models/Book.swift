//
//  Book.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import Foundation

struct Book: Decodable {
    ///책 이름
    let title: String
    
    private let image: String?
    
    ///책 표지 이미지 URL
    var imageUrl: URL? { return URL(string: image ?? "" ) }
    
    //테스트를 위한 코드
    init(title:String, imageUrl: String?){
        self.title = title
        self.image = imageUrl
    }
}
