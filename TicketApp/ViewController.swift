
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    
    @IBOutlet weak var buttonGenerate: UIButton!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func generateQR(_ sender: Any) {
        
        if let myString = txtField.text
        {
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            let ciImage = filter?.outputImage
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            
            let image = UIImage(ciImage: transformImage!)
            myImageView.image = image
            
        }
    }
}

