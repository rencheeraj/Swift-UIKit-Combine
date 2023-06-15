////
////  APIManager.swift
////  Swift UIKit Combine
////
////  Created by Rencheeraj on 09/06/23.
////
//
//import Foundation
//import Combine
//
//class APIManager {
//
//    func makeRequest(endpoint: String, completion: @escaping (Result<ResponceModel, Error>) -> Void) {
//        
//        let subject = PassthroughSubject<Data, Error>()
//        
//        guard let url = URL(string: base_url) else{
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                subject.send(completion: .failure(error))
//                return
//            }
//            
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                let error = NSError(domain: "APIManager", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
//                subject.send(completion: .failure(error))
//                return
//            }
//            
//            guard let responseData = data else {
//                let error = NSError(domain: "APIManager", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
//                subject.send(completion: .failure(error))
//                return
//            }
//            
//            subject.send(responseData)
//            subject.send(completion: .finished)
//        }.resume()
//        
//        _ = subject.sink(receiveCompletion: { completion in
//            // Handle the completion if needed
//        }, receiveValue: { data in
//            completion(.success(data))
//        })
//    }
//}
