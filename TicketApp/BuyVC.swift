
import UIKit

class BuyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    let colores = [#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)]
    
    
    override func viewDidLoad() {
        
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 72
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colores.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idZelda", for: indexPath)
        
        cell.backgroundColor = colores[indexPath.row]
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("navegando...")
    }
    
    func sumarPrecioCeldas()->Int{
        var total: Int = 0
        
        for i in 0...colores.count{
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
