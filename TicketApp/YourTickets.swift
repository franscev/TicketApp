
import UIKit

class YourTickets: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var myTickets = [Event] ()
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        
    }
    
    
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        
        
    }
    
    func refreshTable(){
        tableView?.reloadData()
        print("HOLAAAA")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "idZelda2", for: indexPath) as? BoughtTicketCell else{
            return BoughtTicketCell()
            
        }
        
        cell.titleEvent.text = myTickets[indexPath.row].title
        cell.dateEvent.text =  myTickets[indexPath.row].date
        cell.placeEvent.text = "at " + myTickets[indexPath.row].place
        cell.imageCell.image = myTickets[indexPath.row].image
        
        return cell
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
