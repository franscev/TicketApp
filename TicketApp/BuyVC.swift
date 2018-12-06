
import UIKit

class BuyVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!

    let images = [#imageLiteral(resourceName: "julian"),#imageLiteral(resourceName: "esperanza"),#imageLiteral(resourceName: "pat"),#imageLiteral(resourceName: "tom"),#imageLiteral(resourceName: "chemasaiz")]
    
    let titlesJazz = ["Julian Lage", "E. Spalding", "Pat Metheny", "Tom Misch", "Chema Saiz"]
    
    let titlesRock = ["Radiohead", "La", "s gas", "gsa Misgasch", "gasga gas"]
    
    let titlesMetal = ["Deafheaven", "Metallica", "Wolves in the Throne Room", "Marilyn Manson"]
    
    let places = ["Café Central", "Clamores", "Café Berlín", "UniversiJazz", "Jazzville"]
    
    let dates = ["23/01/19", "13/05/19", "19/05/19", "31/05/19", "03/06/19"]
    
    var searchConcert = [String]()
    
    var concertArray = [Concert]()
    
    var searching = false
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        searchBar.delegate = self
        
        
    }
    
    private func setUpConcerts(){
        
        for i in 0...titlesJazz.count {
            concertArray.append(Concert(title: titlesJazz[i], category: .jazz, date: dates[i], place: places[i]))
        }
        
        for i in 0...titlesRock.count {
            concertArray.append(Concert(title: titlesRock[i], category: .poprock, date: dates[i], place: places[i]))
        }
        
        for i in 0...titlesMetal.count {
            concertArray.append(Concert(title: titlesMetal[i], category: .metal, date: dates[i], place: places[i]))
        }
        
        
    }
    class Concert {
        
        let title: String
        let category: ConcertType
        let date: String
        let place: String
        
        init(title: String, category: ConcertType, date: String, place:String) {
            self.title = title
            self.category = category
            self.date = date
            self.place = place
        }
        
      
        
    }
    
    enum ConcertType: String{
        case jazz = "Jazz"
        case poprock = "Pop/Rock"
        case metal = "Heavy Metal"
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching{
            
            return searchConcert.count
        } else {
        return titlesJazz.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "idZelda", for: indexPath) as? BuyTicketCell else{
            return BuyTicketCell()
        }
        
        cell.imageCell.image = images[indexPath.row]
        cell.titleEvent.text = titlesJazz[indexPath.row]
        cell.placeEvent.text = "at " + places[indexPath.row]
        cell.dateEvent.text = dates[indexPath.row]
        
        if searching{
            
        
        } else{
            
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("navegando...")
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       
        searchConcert = titlesJazz.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
        
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
    
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        <#code#>
//    }
    
//    func didChangeValue<Value>(for keyPath: KeyPath<BuyVC, Value>, withSetMutation mutation: NSKeyValueSetMutationKind, using set: Set<Value>) where Value : Hashable {
//
//    }
    
    
    
}
