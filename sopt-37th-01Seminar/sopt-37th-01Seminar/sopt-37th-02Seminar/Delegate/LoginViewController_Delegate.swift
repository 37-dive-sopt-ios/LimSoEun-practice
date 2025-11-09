//
//  LoginViewController_Delegate.swift
//  sopt-37th-01Seminar
//
//  Created by 임소은 on 10/18/25.
//


import Foundation
import UIKit
import SnapKit


final class LoginViewController_Delegate: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.addLeftPadding()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.addLeftPadding()
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(163)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
            
        }
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
            
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(58)
            
        }
    }
    
    private func presentToWelcomeVC() {
           let welcomeViewController = WelcomeViewController_Delegate()
           welcomeViewController.modalPresentationStyle = .formSheet
           welcomeViewController.name = idTextField.text
           welcomeViewController.delegate = self //delegate
           self.present(welcomeViewController, animated: true)
       }
       
    private func pushToWelcomeVC() {
            let welcomeViewController = WelcomeViewController_Delegate()
            welcomeViewController.name = idTextField.text
            welcomeViewController.delegate = self //delegate
            self.navigationController?.pushViewController(welcomeViewController, animated: true)
       }
       
    @objc
    private func loginButtonDidTap() {
        //presentToWelcomeVC() //모달창
        pushToWelcomeVC() //네비게이션
    }
}

extension LoginViewController_Delegate: WelcomeReloginDelegate {
    public func retryLogin(didTapReloginWith message: String) {
        titleLabel.text = message
        idTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}

//MARK: - Preview
#Preview {
    LoginViewController_Delegate()
}
