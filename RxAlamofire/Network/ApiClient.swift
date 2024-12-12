//
//  ApiClient.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//

import Foundation
import Alamofire
import RxSwift

// Global instance of NetworkLogger
let networkLogger = NetworkLogger()

// Configure global Alamofire Session with the custom EventMonitor
let session = Session(
    eventMonitors: [networkLogger]
)

class APIClient {
    func request<T: Codable>(_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = session.request(urlConvertible).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
