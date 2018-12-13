

import UIKit

class Bought: UIViewController {
    
    var topMostVC: BuyVC?
    
    @IBOutlet weak var succesfullLabel: UILabel!
    
    @IBOutlet weak var getYourTicketsButton: UIButton!
    var succesfull = String ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        succesfullLabel.text = succesfull
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        let presentingViewController = self.presentingViewController
        
  }
    
    @IBAction func getYourTicketsAction(_ sender: Any) {
        
//        [self.presentingViewController?.presentingViewController dismiss:YES completion:nil] as [Any];
//            presentingViewController?.dismiss(animated: true, completion:nil))
//                self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: {})

    }
    
}

