//
//  ViewController.swift
//  Swift UIKit Combine
//
//  Created by Rencheeraj on 09/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        APICaller.shared.getJsonResult() {result in
            switch result{
            case .success(let json):
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }

    @IBAction func submitBtnAction(_ sender: Any) {
    }
    
}

