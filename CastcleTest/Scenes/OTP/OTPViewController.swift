//
//  OTPViewController.swift
//  CastcleTest
//
//  Created by que on 17/12/2564 BE.
//

import UIKit
import OTPFieldView
import ActivityIndicatorManager

class OTPViewController: BaseViewController {
    
    @IBOutlet var otpTextFieldView: OTPFieldView!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var ResendOTPButton: UIButton!
    @IBOutlet weak var ResendOTPLabel: UILabel!
    
    var timer: Timer?
    var countdown: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NextButton.disableWithBGandTextColor(bgColor: .clear,
                                             textColor: .lightGray)
        setupOtpView()
        startCountdown()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.transparentNavigationBar()
        hideKeyboardWhenTappedAround()
        addBackIcon()
        setTitle(title: "Register")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func setupOtpView(){
        self.otpTextFieldView.fieldsCount = 6
        self.otpTextFieldView.fieldBorderWidth = 2
        self.otpTextFieldView.defaultBorderColor = .white
        self.otpTextFieldView.filledBorderColor = .white
        self.otpTextFieldView.cursorColor = .white
        self.otpTextFieldView.displayType = .underlinedBottom
        self.otpTextFieldView.fieldSize = 50
        self.otpTextFieldView.separatorSpace = 16
        self.otpTextFieldView.otpInputType = .numeric
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        self.otpTextFieldView.delegate = self
        self.otpTextFieldView.initializeUI()
    }
    
    @IBAction func onRequestOtp(_ sender: AnyObject) {
        startCountdown()
        self.ResendOTPButton.isEnabled = false
        self.ResendOTPLabel.text = ""
    }
    
    func startCountdown() {
        AIMActivityIndicatorManager.sharedInstance.shouldShowIndicator()
        self.countdown = 60
        let title = String(format:"%@ %lds","Resend Code", self.countdown)
        self.ResendOTPButton.isEnabled = false
        ResendOTPLabel.text = title
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true, block: { (timer) in
            AIMActivityIndicatorManager.sharedInstance.forceHideIndicator()
            self.countdown -= 1
            if self.countdown <= 0 {
                self.ResendOTPButton.isEnabled = true
                self.ResendOTPLabel.text = ""
                self.timer?.invalidate()
                self.timer = nil
            }else {
                let title = String(format:"%@ %lds","Resend Code", self.countdown)
                self.ResendOTPButton.isEnabled = false
                self.ResendOTPLabel.text = title
            }
            
        })
    }
}

// MARK: - OTPFieldViewDelegate
extension OTPViewController: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        if hasEntered {
            NextButton.enableWithBGandTextColor(bgColor: .systemTeal,
                                                textColor: .white)
        }else{
            NextButton.disableWithBGandTextColor(bgColor: .clear,
                                                 textColor: .lightGray)
        }
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
}
