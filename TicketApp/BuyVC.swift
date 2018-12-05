
import UIKit

class BuyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!

    let images = [#imageLiteral(resourceName: "julian"),#imageLiteral(resourceName: "esperanza"),#imageLiteral(resourceName: "pat"),#imageLiteral(resourceName: "tom"),#imageLiteral(resourceName: "chemasaiz")]
    
    let titles = ["Julian Lage", "E. Spalding", "Pat Metheny", "Tom Misch", "Chema Saiz"]
    let places = ["Café Central", "Clamores", "Café Berlín", "UniversiJazz", "Jazzville"]
    let dates = ["23/01/19", "13/05/19", "19/05/19", "31/05/19", "03/06/19"]
    

    
    override func viewDidLoad() {
        
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 140
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idZelda", for: indexPath) as! BuyTicketCell
        
        cell.imageCell.image = images[indexPath.row]
        cell.titleEvent.text = titles[indexPath.row]
        cell.placeEvent.text = "at " + places[indexPath.row]
        cell.dateEvent.text = dates[indexPath.row]
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("navegando...")
    }
    
    func sumarPrecioCeldas()->Int{
        var total: Int = 0
        
        for i in 0...images.count{
            let cell = tableView.cellForRow(at: IndexPath(row: i, section: 1)) as! BuyTicketCell
            
            
            total += cell.totalPrice
            
        
        }
        
        buyButton.setTitle(String(total) + "€", for: UIControlState.normal)
        
        
        return total
    }
    
//    func didChangeValue<Value>(for keyPath: KeyPath<BuyVC, Value>, withSetMutation mutation: NSKeyValueSetMutationKind, using set: Set<Value>) where Value : Hashable {
//
//    }
    
    
    
}
