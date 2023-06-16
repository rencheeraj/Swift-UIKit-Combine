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
        valueCall()
    }
    func valueCall(){
        apiCaller.passThroughSubject.sink { value in
            print(value)
        } receiveValue: { value in
            DispatchQueue.main.async {
                print(value)
                self.displayLabel.text = value.punchline
            }
        }.store(in: &observer)
    }

    @IBAction func submitBtnAction(_ sender: Any) {
        DispatchQueue.main.async { [self] in
            apiCaller.getJsonResult()
        }
//        self.viewDidLoad()
    }
    
}

