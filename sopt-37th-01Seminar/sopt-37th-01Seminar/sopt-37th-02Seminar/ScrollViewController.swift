//
//  ScrollViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 임소은 on 10/18/25.
//

import UIKit
import SnapKit

class ScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()

    
    //MARK: - 색상 뷰
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
 
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
   
    //MARK: - layout
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }

        let height: CGFloat = 337
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(height)
            $0.trailing.equalTo(contentView.snp.centerX)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(contentView.snp.centerX)
            $0.height.equalTo(height)
            $0.trailing.equalToSuperview()
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(height)
            $0.trailing.equalTo(contentView.snp.centerX)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalTo(contentView.snp.centerX)
            $0.height.equalTo(height)
            $0.trailing.equalToSuperview()
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(height)
            $0.trailing.equalTo(contentView.snp.centerX)
            $0.bottom.equalToSuperview()
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalTo(contentView.snp.centerX)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(height)
            $0.bottom.equalTo(contentView) // contentView의 마지막 요소로, bottom을 설정합니다.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

}

//MARK: - preview
#Preview {
    ScrollViewController()
}
