////
////  NetworkLogger.swift
////  RetailApp
////
////  Created by Mohamed Ben Hmida on 2024/09/13.
////
///
import Foundation
import Alamofire
import Alamofire

class NetworkLogger: EventMonitor {
    func requestDidFinish(_ request: Request) {
        logRequest(request)
    }
    
    func request(_ request: Request, didParseResponse response: DataResponse<Data?, AFError>) {
        logResponse(response)
    }
    
    func requestDidFail(_ request: Request, error: AFError) {
        logError(error)
    }
    
    private func logRequest(_ request: Request) {
        let urlString = request.request?.url?.absoluteString ?? "Unknown URL"
        let method = request.request?.method?.rawValue ?? "Unknown Method"
        let headers = request.request?.headers.description ?? "No Headers"
        let body = request.request?.httpBody.flatMap { String(data: $0, encoding: .utf8) } ?? "No Body"
        
        print("<<NetworkLogger>> Request URL: \(urlString)")
        print("<<NetworkLogger>> Method: \(method)")
        print("<<NetworkLogger>> Headers: \(headers)")
        print("<<NetworkLogger>> Body: \(body)")
        print("Hello ")
    }
    
    private func logResponse(_ response: DataResponse<Data?, AFError>) {
        let urlString = response.request?.url?.absoluteString ?? "Unknown URL"
        let statusCode = response.response?.statusCode ?? 0
        let responseBody: String
        
        if let data = response.data {
            // Attempt to decode the data to a string
            responseBody = String(data: data, encoding: .utf8) ?? "Unable to decode response body"
        } else {
            responseBody = "No Response Data"
        }
        
        print("<<NetworkLogger>> Response URL: \(urlString)")
        print("<<NetworkLogger>> Status Code: \(statusCode)")
        print("<<NetworkLogger>> Response Body: \(responseBody)")
    }
    
    private func logError(_ error: AFError) {
        print("<<NetworkLogger>> Error: \(error.localizedDescription)")
    }
}
