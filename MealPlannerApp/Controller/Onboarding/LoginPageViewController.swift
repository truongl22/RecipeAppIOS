//
//  LoginPageViewController.swift
//  MealPlannerApp
//
//  Created by Lâm Trương on 8/21/23.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Let's achieve your goals together."
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private let accountButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(red: 0.19, green: 0.52, blue: 0.42, alpha: 1.00)
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 30
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubViews(welcomeLabel, accountButton)
        
        accountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        setUpView()
        
    }
    
    @objc private func didTapCreateAccount() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            accountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accountButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            accountButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor, constant: -20),
            accountButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
}
