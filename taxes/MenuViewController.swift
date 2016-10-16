//
//  MenuViewController.swift
//  taxes
//
//  Created by adhoc on 21/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var userName=String()
    @IBOutlet weak var taxe38btn: UIButton!
    @IBOutlet weak var taxeboissonbtn: UIButton!
    @IBOutlet weak var taxesejourbtn: UIButton!
    @IBOutlet weak var taxetnbbtn: UIButton!

    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color:UIColor=UIColor(red: 84/255, green: 124/255, blue:102/255, alpha: 1)
        
        taxe38btn.layer.borderWidth=2
        taxe38btn.layer.borderColor=color.CGColor
        taxe38btn.layer.cornerRadius=10
        taxe38btn.layer.masksToBounds=true
        
        taxeboissonbtn.layer.borderWidth=2
        taxeboissonbtn.layer.borderColor=color.CGColor
        taxeboissonbtn.layer.cornerRadius=10
        taxeboissonbtn.layer.masksToBounds=true
        
        taxesejourbtn.layer.borderWidth=2
        taxesejourbtn.layer.borderColor=color.CGColor
        taxesejourbtn.layer.cornerRadius=10
        taxesejourbtn.layer.masksToBounds=true
        
        taxetnbbtn.layer.borderWidth=2
        taxetnbbtn.layer.borderColor=color.CGColor
        taxetnbbtn.layer.cornerRadius=10
        taxetnbbtn.layer.masksToBounds=true
        
        userNameLabel.text=userName
    
    }
    
}
