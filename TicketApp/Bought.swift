//
//  Bought.swift
//  TicketApp
//
//  Created by Fransiscou Javier Sarró Redondo on 10/12/18.
//  Copyright © 2018 alumnos. All rights reserved.
//

import UIKit

class Bought: UIViewController {
    @IBOutlet weak var succesfullLabel: UILabel!
    
    var succesfull = String ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        succesfullLabel.text = succesfull
        
        self.navigationItem.setHidesBackButton(true, animated:true)
  }
    
    
}
