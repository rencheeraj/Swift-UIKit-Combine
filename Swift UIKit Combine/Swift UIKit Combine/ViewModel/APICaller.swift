//
//  APICaller.swift
//  Swift UIKit Combine
//
//  Created by Rencheeraj on 09/06/23.
//

import Foundation
import Combine

final class APICaller {
    let passThroughSubject = PassthroughSubject<ResponceModel,Never>()
    public func getJsonResult() {
        guard let url = URL(string: base_url) else{
            return
        }
        let request = NSMutableURLRequest(url: url as URL)
        
        URLSession.shared.dataTask(with: request as URLRequest) { [self](data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let data = data else{
                passThroughSubject.send(completion: .failure(error! as! Never))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(ResponceModel.self, from: data)
                print(result)
                passThroughSubject.send(result)
//                passThroughSubject.send(completion: .finished)
            }
            catch {
                passThroughSubject.send(completion: .failure(error as! Never))
            }
        } .resume()
    }
}
