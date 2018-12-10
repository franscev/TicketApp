
import UIKit

class YourTickets: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let yourTicketDetail = segue.destination as! YourTicketDetail
        button = sender as! UIButton
        
        //let celda = sender as! BuyTicketCell
        
//        buyDetailVC.artistName = celda.titleEvent.text!
//        buyDetailVC.imageArtist = celda.imageCell!
//        buyDetailVC.place = celda.placeEvent.text!
//        buyDetailVC.date = celda.dateEvent.text!
    }

}
