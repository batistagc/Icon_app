//
//  SecondViewController.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 03/06/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var mybutton: UIButton!
    
    @IBOutlet weak var mytextField: UITextView!
    
//    @IBOutlet weak var informationsDetails: UITextView!
//    @IBOutlet weak var understoodButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mytextField)
        view.addSubview(mybutton)

    }
    
    
    }
