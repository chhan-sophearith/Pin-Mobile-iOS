//
//  ViewController.swift
//  Pin-Mobile-iOS
//
//  Created by Chhan Sophearith on 14/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paymentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapPayment(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "PinVC") as? PinVC else { return }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated:true, completion:nil)
    }
}

