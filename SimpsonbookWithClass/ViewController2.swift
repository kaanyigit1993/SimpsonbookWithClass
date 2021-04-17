//
//  ViewController2.swift
//  SimpsonbookWithClass
//
//  Created by KAAN YİĞİT on 17.04.2021.
//

import UIKit

class ViewController2: UIViewController {

   
    
    @IBOutlet weak var lblJob: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var getSimpsonMember : SimpsonClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = getSimpsonMember?.name
        lblJob.text = getSimpsonMember?.job
        imageView.image = getSimpsonMember?.image
        
    }
    

    

}
