//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by terry on 2023/09/18.
//

import UIKit
import SnapKit

final class ReviewWriteViewController: UIViewController {
    private lazy var presenter = ReviewWritePresenter(viewController: self)
}
extension ReviewWriteViewController: ReviewWriteProtocol {
    
}
