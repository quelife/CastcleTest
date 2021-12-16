//
//  WelcomeController.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import UIKit

class WelcomeController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.transparentNavigationBar()
        setTitle(title: "Register")
    }
    
    @IBAction func buttonNextAction(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PhoneViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
