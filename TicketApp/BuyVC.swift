
import UIKit

class BuyVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var buyTicketCell = [BuyTicketCell]()
    
    let imagesJazz = [#imageLiteral(resourceName: "julian"),#imageLiteral(resourceName: "esperanza"),#imageLiteral(resourceName: "pat"),#imageLiteral(resourceName: "tom"),#imageLiteral(resourceName: "chemasaiz"),#imageLiteral(resourceName: "andrea")]
    let imagesRock = [#imageLiteral(resourceName: "radiohead"),#imageLiteral(resourceName: "muse"),#imageLiteral(resourceName: "daughter"),#imageLiteral(resourceName: "clairo"),#imageLiteral(resourceName: "zauma")]
    let imagesMetal = [#imageLiteral(resourceName: "deafheaven"),#imageLiteral(resourceName: "metallica"),#imageLiteral(resourceName: "mago"),#imageLiteral(resourceName: "black"),#imageLiteral(resourceName: "iron")]
    
    let titlesJazz = ["Julian Lage", "E. Spalding", "Pat Metheny", "Tom Misch", "Chema Saiz", "Andrea de Blas"]
    let titlesRock = ["Radiohead", "Muse", "Daughter", "Clairo", "Zaumazein"]
    let titlesMetal = ["Deafheaven", "Metallica", "Mago de Oz", "Black Sabbath", "Iron Maiden"]
    
    let placesJazz = ["Café Central", "Clamores", "Café Berlín", "UniversiJazz", "Jazzville", "Café Despertar"]
    let placesRock = ["Tempo Club", "Sala But", "T. Barceló", "Café La Palma", "Siroco"]
    let placesMetal = ["Weirdo", "Khurgan", "La Leyenda", "Sala Caracol", "Lemon"]
    
    let datesJazz = ["12/03/19", "15/06/19", "19/05/19", "12/11/19", "01/03/19", "02/04/19"]
    let datesRock = ["23/01/19", "13/05/19", "05/08/19", "26/07/19", "09/09/19"]
    let datesMetal = ["21/05/19", "01/02/19", "14/09/19", "01/12/19", "03/13/19"]
    
    var searchConcert = [String]()
    
    var eventArray = [Event]()
    var currentEventArray = [Event]()
    
    
    override func viewDidLoad() {
        
        setUpConcerts()
        setUpSearchBar()
        setUpTableView()
    }
   
    
    //CONCERTS
    private func setUpConcerts(){
        
        //JAZZ
        for i in 0...(titlesJazz.count - 1) {
            eventArray.append(Event(title: titlesJazz[i], category: .jazz, date: datesJazz[i], place: placesJazz[i], image:imagesJazz[i], tickets: 0, price:20))
        }
        
        //ROCK
        for i in 0...(titlesRock.count - 1) {
            eventArray.append(Event(title: titlesRock[i], category: .indieRock, date: datesRock[i], place: placesRock[i], image:imagesRock[i], tickets:0, price:20))
        }
        
        //METAL
        for i in 0...(titlesMetal.count - 1){
            eventArray.append(Event(title: titlesMetal[i], category: .metal, date: datesMetal[i], place: placesMetal[i], image:imagesMetal[i], tickets:0, price:20))
        }
        currentEventArray = eventArray
    }
    
    //TABLE VIEW
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentEventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "idZelda", for: indexPath) as? BuyTicketCell else{
            return BuyTicketCell()
        }
        
        cell.titleEvent.text = currentEventArray[indexPath.row].title
        cell.dateEvent.text =  currentEventArray[indexPath.row].date
        cell.placeEvent.text = "at " + currentEventArray[indexPath.row].place
        cell.imageCell.image = currentEventArray[indexPath.row].image
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("navegando...")
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
    }
    
    //SEARCH BAR
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentEventArray = eventArray
            tableView.reloadData()
            return}
        
        currentEventArray = eventArray.filter({event -> Bool in
           event.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    
        switch selectedScope{

        case 0:
            currentEventArray = eventArray
        case 1:
            currentEventArray = eventArray.filter({ event -> Bool in
            event.category == Event.ConcertType.indieRock
                })
        case 2:
            
            currentEventArray = eventArray.filter({ event -> Bool in
            event.category == Event.ConcertType.jazz
                })
        case 3:
            currentEventArray = eventArray.filter({ event -> Bool in
            event.category == Event.ConcertType.metal
            })
        default:
            break
    }
    tableView.reloadData()
   }
    

//    func sumarPrecioCeldas()->Int{
//        var total: Int = 0
//
//        for i in 0...(imagesJazz.count - 1){
//            let cell = tableView.cellForRow(at: IndexPath(row: i, section: 1)) as! BuyTicketCell
//            total += cell.totalPrice
//        }
//        buyButton.setTitle(String(total) + "€", for: UIControlState.normal)
//        return total
//    }
//
}
