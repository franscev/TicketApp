
import UIKit

class YourTickets: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
  
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "idZelda3", for: indexPath) as? BoughtTicketCell else{
            return BoughtTicketCell()
        }
        
        cell.titleLabel.text = boughtTickets[indexPath.row].title
        cell.dateLabel.text =  boughtTickets[indexPath.row].date
        cell.placeLabel.text = boughtTickets[indexPath.row].place
        cell.imageCell.image = boughtTickets[indexPath.row].image
        
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let yourTicketDetail = segue.destination as! YourTicketDetail
        
        let celda = sender as! BoughtTicketCell
        
        yourTicketDetail.artistName = celda.titleLabel.text!
        yourTicketDetail.imageArtist = celda.imageCell.image!
        yourTicketDetail.place = celda.placeLabel.text!
        yourTicketDetail.date = celda.dateLabel.text!
        
    }

}
