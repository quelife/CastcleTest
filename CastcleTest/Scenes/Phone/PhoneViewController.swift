//
//  PhoneViewController.swift
//  CastcleTest
//
//  Created by que on 16/12/2564 BE.
//

import UIKit
import RxSwift
import RxCocoa
import ActivityIndicatorManager
import DropDown

class PhoneViewController: BaseViewController {

    private let countryViewModel = CountryViewModel()
    private let disposeBag = DisposeBag()

    @IBOutlet weak var dropButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dialCodeLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var OTPButton: UIButton!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        OTPButton.disableWithBGandTextColor(bgColor: .clear,
                                           textColor: .lightGray)

        subscribeViewModel()
        countryViewModel.getCountry()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.transparentNavigationBar()
        hideKeyboardWhenTappedAround()
        addBackIcon()
        setTitle(title: "Register")
    }
    
    @IBAction func buttonSelectCode(_ sender: UIButton) {
        dropDown.selectionAction = { (index: Int, item: String) in
            self.dialCodeLabel.text = self.countryViewModel.payload[index].dialCode
            self.nameLabel.text = self.countryViewModel.payload[index].code
       }
        dropDown.width = 140
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.show()
    }
    
    @IBAction func buttonOTPAction(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "OTPViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: - SubscribeViewModel
extension PhoneViewController {
    func subscribeViewModel() {
        // MARK: - Forecast5Subject
        AIMActivityIndicatorManager.sharedInstance.shouldShowIndicator()
        self.countryViewModel.CountrySubject.subscribe(
            onNext: { response in
                AIMActivityIndicatorManager.sharedInstance.forceHideIndicator()
                self.dropDown.anchorView = self.dropButton
                self.dropDown.dataSource = self.countryViewModel.countryStringName
                self.dialCodeLabel.text = self.countryViewModel.payload.first?.dialCode
                self.nameLabel.text = self.countryViewModel.payload.first?.code
            }).disposed(by: disposeBag)
    }
}

// MARK: - UITextFieldDelegate
extension PhoneViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if !text.isEmpty{
            OTPButton.enableWithBGandTextColor(bgColor: .systemTeal,
                                                textColor: .white)
        } else {
            OTPButton.disableWithBGandTextColor(bgColor: .clear,
                                               textColor: .lightGray)
        }
        return true
    }
}
