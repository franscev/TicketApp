
import UIKit

class Event: NSObject {
    
    let title: String
    let category: ConcertType
    let date: String
    let place: String
    let image: UIImage
    
    let price: Int
    let tickets: Int
    
    init(title: String, category: ConcertType, date: String, place:String, image:UIImage, tickets: Int, price: Int) {
        self.title = title
        self.category = category
        self.date = date
        self.place = place
        self.image = image
        self.tickets = tickets
        self.price = price
        
    }
    
    enum ConcertType: String{
        case jazz = "Jazz"
        case indieRock = "Indie/Rock"
        case metal = "Heavy Metal"
        
    }

}
