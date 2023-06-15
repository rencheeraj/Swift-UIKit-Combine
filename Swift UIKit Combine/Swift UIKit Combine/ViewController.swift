//
//  ViewController.swift
//  Swift UIKit Combine
//
//  Created by Rencheeraj on 09/06/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    let apiCaller = APICaller()
    private var model = [ResponceModel]()
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    var observer = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.passThroughSubject.sink { value in
//            print(value)
//        } receiveValue: { value in
//            DispatchQueue.main.async {
//                print(value)
//                self.displayLabel.text = value
//            }
//        }.store(in: &observer)
        

        
    }

    @IBAction func submitBtnAction(_ sender: Any) {
        DispatchQueue.main.async { [self] in
            apiCaller.getJsonResult() { [self] result in
                switch result {
                case .success(let data):
                    print("Received data: \(data)")

                case .failure(let error):
                    // Handle the error
                    print("Request failed: \(error)")
                }
        }

//        apiCaller.passThroughSubject.sink(receiveCompletion: {
//            completion in
//            switch completion{
//            case .finished:
//                print("Finished")
//            case .failure(_):
//                print("Error")
//            }
//        }, receiveValue: { valuek in
//            print(valuek)})
        
//        apiCaller.passThroughSubject.sink { value in
//            print(value)
//        } receiveValue: { value in
//            self.displayLabel.text = value
//        }

//        APICaller.shared.getJsonResult() {result in
//            switch result{
//            case .success(let json):
//                print(json)
//                self.passThroughSubject.send("\(json.punchline)")
//            case .failure(let error):
//                print(error)
//            }
        }
    }
    
}

