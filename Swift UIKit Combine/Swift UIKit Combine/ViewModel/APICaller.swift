//
//  APICaller.swift
//  Swift UIKit Combine
//
//  Created by Rencheeraj on 09/06/23.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    public func getJsonResult(completion : @escaping (Result<ResponceModel, Error>) -> Void) {
        guard let url = URL(string: base_url) else{
            return
        }
        let request = NSMutableURLRequest(url: url as URL)
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            guard let data = data else{
                completion(.failure(error!))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ResponceModel.self, from: data)
                print(result)
                let response = result
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        } .resume()
    }
}
