//
//  Method.swift
//  sopt-37th-01Seminar
//
//  Created by 임소은 on 11/8/25.
//

///라이브러리를 활용한다면 할 필요 X..!
//4주차
import Foundation

/// HTTP 메서드 (Moya의 Method와 동일!)
enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
