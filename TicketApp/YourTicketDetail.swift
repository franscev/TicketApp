
import UIKit

class YourTicketDetail: UIViewController {

    @IBOutlet weak var imageQR: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var artistImageView: UIImageView!
    
    
    var artistName = String ()
    var date = String ()
    var place = String ()
    var imageArtist = UIImage ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistNameLabel.text = artistName
        dateLabel.text = date
        placeLabel.text = place
        artistImageView.image = imageArtist
        generateQR()
    }


    // GENERATE QR
    func generateQR(){
        let data = artistName.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        let ciImage = filter?.outputImage
        
        let transform = CGAffineTransform(scaleX: 5, y: 5)
        let transformImage = ciImage?.transformed(by: transform)
        
        let image = UIImage(ciImage: transformImage!)
        imageQR.image = image
    }
}

