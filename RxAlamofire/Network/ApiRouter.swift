//
//  ApiRouter.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case getProducts

    func asURLRequest() throws -> URLRequest {
        let url = URL(string: "https://dummyjson.com/products")!
        var request = URLRequest(url: url)
        request.method = .get
        return request
    }
}
