
import UIKit

class BuyDetailVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pictureImgView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var artistName = String ()
    var date = String ()
    var place = String ()
    var imageArtist = UIImageView ()
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    public var totalPrice: Int = 0
    @IBOutlet weak var priceForEntry: UILabel!
    @IBOutlet weak var numberOfTickets: UILabel!
    
    var quantityTickets = 0
    
    var event = [Event]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        initStepper()
        nameLabel.text = artistName
        dateLabel.text = date
        placeLabel.text = place
        pictureImgView.image = imageArtist.image
      
        
    }
    
    @IBAction func buyTicketButton(_ sender: Any) {
    

    }
    
    func initStepper(){
        
        stepper.maximumValue = 10
        stepper.minimumValue = 0
        stepper.stepValue = 1
        stepper.value = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let bought = segue.destination as! Bought
        //let yourTickets = segue.destination as! YourTickets

        
        
        buyButton = sender as! UIButton
        
//        var yourTickets = YourTickets()
        
        
        bought.succesfull = "You have bought " + String(quantityTickets) + " tickets" + " of " + artistName + " " + place + " " + "in " + date
        
//        let buyVC = BuyVC()
//
//        yourTickets.myTickets = buyVC.eventArrayCopy
//
//        print(yourTickets.myTickets)
//
//        yourTickets.refreshTable()
        
      
        
   
        
    }
    
    @IBAction func chooseNumberOfTickets(_ sender: UIStepper) {
        quantityTickets = Int(sender.value)
        numberOfTickets.text = "x" + String(quantityTickets) + "(20€)"
        
        totalPrice = quantityTickets * 20
        
        priceForEntry.text = String(totalPrice) + "€"
    }
}
