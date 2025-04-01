//
//  LoadingView.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 31/03/25.
//

import UIKit

extension UIView {
    func showLoadingView() {
        reset()
        let loadingView = setupLoadingView()
        addSubview(loadingView)
        loadingView.startLoading()
    }
    
    func hideLoadingView() {
        reset()
    }
    
    func reset() {
        viewWithTag(LoadingViewConstansts.tag)?.removeFromSuperview()
    }
    
    private func setupLoadingView() -> LoadingViewContainer {
        let view = LoadingViewContainer()
        view.tag = LoadingViewConstansts.tag
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        return view
    }
    
    enum LoadingViewConstansts {
        static let tag = 40404
    }
}

final class LoadingViewContainer1: UIView {
    private let loading = UIActivityIndicatorView(style: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(loading)
    }
}

final class LoadingViewContainer: UIView {
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
        isHidden = false
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        isHidden = true
    }
}

