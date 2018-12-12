
import UIKit

class YourTickets: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
  
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshTable()
    }
    
    
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        
        
    }

    
    func refreshTable(){
        tableView?.reloadData()
       

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boughtTickets.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "idZelda2", for: indexPath) as! BoughtTicketCell
        
        cell.titleEvent.text = boughtTickets[indexPath.row].title
        cell.dateEvent.text =  boughtTickets[indexPath.row].date
        cell.placeEvent.text = "at " + boughtTickets[indexPath.row].place
        cell.imageCell.image = boughtTickets[indexPath.row].image
        
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
