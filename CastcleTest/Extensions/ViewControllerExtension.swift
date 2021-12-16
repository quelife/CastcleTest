//
//  ViewControllerExtension.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import UIKit

extension UIViewController {
    
    func setTitle(title: String = "") {
        self.navigationItem.title = title
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
        
    func addBackIcon(color: UIColor = .white) {
        let btnBack = UIButton.init(type: .custom)
        btnBack.setImage(UIImage(named: "back_arrow")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnBack.addTarget(self, action: #selector(didTapBackButton(sender:)), for: .touchUpInside)
        btnBack.tintColor = color
        let stackview = UIStackView.init(arrangedSubviews: [btnBack])
        stackview.distribution = .equalSpacing
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.spacing = 8
        let rightBarButton = UIBarButtonItem(customView: stackview)
        self.navigationItem.leftBarButtonItem = rightBarButton
    }
        
    @objc func didTapBackButton(sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }

    func hideNavigationBar(animated: Bool = false){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    func showNavigationBar(animated: Bool = false) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

