
import UIKit

class BuyDetailVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pictureImgView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var artistName = String ()
    var date = String ()
    var place = String ()
    var imageArtist = UIImage ()
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    public var totalPrice: Int = 0
    @IBOutlet weak var priceForEntry: UILabel!
    @IBOutlet weak var numberOfTickets: UILabel!
    
    var quantityTickets = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        initStepper()
        setLabels()
    }
    
    // SET INITIAL LABELS
    func setLabels(){
    nameLabel.text = artistName
    dateLabel.text = date
    placeLabel.text = place
    pictureImgView.image = imageArtist
    
    buyButton.isEnabled = false
    buyButton.backgroundColor = UIColor.lightGray
    
    }
    
    // ACTION BUTTON FOR SENDER PREPARE
    @IBAction func buyTicketButton(_ sender: Any) {
    
    }
    
    // SET STEPPER
    func initStepper(){
        
        stepper.maximumValue = 10
        stepper.minimumValue = 0
        stepper.stepValue = 1
        stepper.value = 0
    }
    
    
    // SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let bought = segue.destination as! Bought
        buyButton = sender as! UIButton
        
        let event = Event(title: artistName, category: Event.ConcertType.indieRock, date: date, place: place, image: imageArtist, tickets: 0, price: 0)
        boughtTickets.append(event)
        bought.succesfull = "You have bought " + String(quantityTickets) + " tickets" + " of " + artistName + " " + place + " " + "in " + date + ". \r\n" + "\r\n Go to ''Your Tickets'' section for get it."
        saveData()
    }
    
    // CHOOSE TICKET WITH STEPPER
    @IBAction func chooseNumberOfTickets(_ sender: UIStepper) {
        
        quantityTickets = Int(sender.value)
        numberOfTickets.text = "x" + String(quantityTickets)
        
        totalPrice = quantityTickets * 20
        priceForEntry.text = " - " + String(totalPrice) + "€"
        
        if quantityTickets > 0 {
            buyButton.isEnabled = true
            buyButton.backgroundColor = UIColor(named: "Rojo")
        }else{
            buyButton.isEnabled = false
            buyButton.backgroundColor = UIColor.lightGray
            priceForEntry.text = "-"
            numberOfTickets.text = ""
        }
    }
}
