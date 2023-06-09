//
//  ViewController.swift
//  Swift UIKit Combine
//
//  Created by Rencheeraj on 09/06/23.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var model = [ResponceModel]()
    let passThroughSubject = PassthroughSubject<String, Error>()
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    var observer = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.passThroughSubject.sink { value in
            print(value)
        } receiveValue: { value in
            DispatchQueue.main.async {
                print(value)
                self.displayLabel.text = value
            }
        }.store(in: &observer)

        
    }

    @IBAction func submitBtnAction(_ sender: Any) {
        
        APICaller.shared.getJsonResult() {result in
            switch result{
            case .success(let json):
                print(json)
                self.passThroughSubject.send("\(json.punchline)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

