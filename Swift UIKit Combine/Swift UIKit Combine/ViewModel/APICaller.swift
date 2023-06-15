//
//  APICaller.swift
//  Swift UIKit Combine
//
//  Created by Rencheeraj on 09/06/23.
//

import Foundation
import Combine

final class APICaller {
    let passThroughSubject = PassthroughSubject<ResponceModel, Error>()
    public func getJsonResult(completion: @escaping (Result<ResponceModel, Error>) -> Void) {
        guard let url = URL(string: base_url) else{
            return
        }
        let request = NSMutableURLRequest(url: url as URL)
        
        URLSession.shared.dataTask(with: request as URLRequest) { [self](data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                passThroughSubject.send(completion: .failure(error))
                return
            }
            guard let data = data else{
                passThroughSubject.send(completion: .failure(error!))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ResponceModel.self, from: data)
                print(result)
                let response = result
                passThroughSubject.send(result)
                passThroughSubject.send(completion: .finished)
            }
            catch {
                passThroughSubject.send(completion: .failure(error))
            }
        } .resume()
        _ = passThroughSubject.sink(receiveCompletion: { completion in
            // Handle the completion if needed
        }, receiveValue: { response in
            completion(.success(response))
        })

    }
}
