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
    
    private lazy var bookTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("책 제목", for: .normal)
        button.setTitleColor(.tertiaryLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 23.0,weight: .bold)
        
        return button
    }()
    
    private lazy var contentsTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .tertiaryLabel
        textView.text = "입력해주세요."
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        textView.delegate = self
        
        return textView
    }()
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setupNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                           target: self,
                                                           action: #selector(didTapLeftBarButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(didTapRightBarButton))
        
    }
    
    func showCloseAlertSheet(){
        let alertContorller = UIAlertController(title: "작성중인 내용이 있습니다. 정말 닫으시겠습니까?", message: nil, preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: "닫기", style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [closeAction,cancelAction].forEach{
            alertContorller.addAction($0)
        }
        
        present(alertContorller, animated: true)
    }
    
    func close(){
        dismiss(animated: true)
    }
    
    func setupViews(){
        view.backgroundColor = .systemBackground
        
        [bookTitleButton, contentsTextView, imageView].forEach{
            view.addSubview($0)
        }
        
        bookTitleButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20.0)
        }
        contentsTextView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalTo(bookTitleButton.snp.bottom).offset(16.0)
        }
        imageView.snp.makeConstraints{
            $0.leading.equalTo(contentsTextView.snp.leading)
            $0.trailing.equalTo(contentsTextView.snp.trailing)
            $0.top.equalTo(contentsTextView.snp.bottom).offset(16.0)
            
            $0.height.equalTo(200)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .tertiaryLabel else {
            return
        }
        
        textView.text = ""
        textView.textColor = .label
    }
}

private extension ReviewWriteViewController {
    @objc func didTapLeftBarButton(){
        presenter.didTapLeftBarButton()
    }
    
    @objc func didTapRightBarButton(){
        presenter.didTapRightBarButton()
    }
}
