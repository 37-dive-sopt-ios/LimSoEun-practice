//
//  ChatViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 임소은 on 11/1/25.
//

import UIKit
import SnapKit

final class ChatViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain) // 테이블 뷰 객체 초기화
    
    private var chatRooms: [ChatRoomModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
        setDelegate()
        loadMockData()
    }
    
    private func setUI() {  // 기본 속성 정의
        view.backgroundColor = .white
        title = "채팅"
        tableView.separatorStyle = .singleLine
    }
    
    private func setLayout() {           // 레이아웃 잡기~!
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() { // 누구한테 짬 때릴건지 채택!
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMockData() {
        chatRooms = ChatRoomModel.mockData
        tableView.reloadData()
    }
}

#Preview {
    ChatViewController()
}

// MARK: - UITableViewDelegate

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(chatRooms[indexPath.row].name) 채팅방 선택됨")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72 //셀의 높이지정
    }
}

// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
        // -> return 10 안쓰고 10만써도 가능 ~
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(chatRoom: chatRooms[indexPath.row])
        return cell
    }
}

#Preview {
    ChatViewController()
}
