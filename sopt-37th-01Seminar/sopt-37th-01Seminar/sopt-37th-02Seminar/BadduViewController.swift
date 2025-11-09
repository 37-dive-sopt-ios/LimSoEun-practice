//
//  BadduViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 임소은 on 10/18/25.
//


import UIKit

class BadduViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setLayout() {
        [바둑알1, 바둑알2, 방어막].forEach { [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([바둑알1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
                                     바둑알1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                                     바둑알1.widthAnchor.constraint(equalToConstant: 20),
                                     바둑알1.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([바둑알2.topAnchor.constraint(equalTo: self.바둑알1.bottomAnchor, constant: 40),
                                     바둑알2.leadingAnchor.constraint(equalTo: self.바둑알1.trailingAnchor, constant: 40),
                                     바둑알2.widthAnchor.constraint(equalToConstant: 20),
                                     바둑알2.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([방어막.leadingAnchor.constraint(equalTo: 바둑알2.trailingAnchor, constant: 20),
                                     방어막.topAnchor.constraint(equalTo: 바둑알2.bottomAnchor, constant: 20),
                                     방어막.widthAnchor.constraint(equalToConstant: 60),
                                     방어막.heightAnchor.constraint(equalToConstant: 20)])
        

    }
    
    var 바둑알1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20,
                                                                  height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var 바둑알2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20,
                                                                  height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    var 방어막: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
}

#Preview {
    BadduViewController()
}
