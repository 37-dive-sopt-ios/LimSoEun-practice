//
//  LoginViewController_MVC.swift
//  sopt-37th-01Seminar
//
//  Created by 임소은 on 11/1/25.
//

import UIKit

final class LoginViewController_MVC: UIViewController {

    // MARK: - Properties
    private let rootView = LoginView_MVC()

    // MARK: - Life Cycle
    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
    }

    // MARK: - setup
    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }

    // MARK: - Private Methods
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_MVC()
        welcomeViewController.name = rootView.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
