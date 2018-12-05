
import UIKit

class BuyTicketCell: UITableViewCell {
    @IBOutlet weak var stepper: UIStepper!
    
   
    
    public var totalPrice: Int = 0
    
    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var dateEvent: UILabel!
    @IBOutlet weak var placeEvent: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var priceForEntry: UILabel!
    @IBOutlet weak var numberOfTickets: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        initStepper()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    func initStepper(){

        stepper.maximumValue = 10
        stepper.minimumValue = 0
        stepper.stepValue = 1
        stepper.value = 0
    }

    @IBAction func chooseNumberOfTickets(_ sender: UIStepper) {
        
        var quantityTickets = 0
        quantityTickets = Int(sender.value)
        numberOfTickets.text = "x" + String(quantityTickets) + "(20€)"
        
        totalPrice = quantityTickets * 20
        
        priceForEntry.text = String(totalPrice) + "€"
    }
    
    
}
