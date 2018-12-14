

import Foundation
import UIKit

var artistsData = [String]()
var placesData = [String]()
var datesData = [String]()
var imagesData = [String]()

private let keyArtist = "1"
private let keyPlace = "2"
private let keyDate = "3"
private let keyImage = "4"

var dictionary: [String: UIImage] = [:]

// SET DICTIONARY
func setDictionary(){
    
    dictionary["Julian Lage"] = #imageLiteral(resourceName: "julian")
    dictionary["E. Spalding"] = #imageLiteral(resourceName: "esperanza")
    dictionary["Pat Metheny"] = #imageLiteral(resourceName: "pat")
    dictionary["Tom Misch"] = #imageLiteral(resourceName: "tom")
    dictionary["Chema Saiz"] = #imageLiteral(resourceName: "chemasaiz")
    
    dictionary["Deafheaven"] = #imageLiteral(resourceName: "deafheaven")
    dictionary["Metallica"] = #imageLiteral(resourceName: "metallica")
    dictionary["Mago de Oz"] = #imageLiteral(resourceName: "mago")
    dictionary["Black Sabbath"] = #imageLiteral(resourceName: "black")
    dictionary["Iron Maiden"] = #imageLiteral(resourceName: "iron")
    
    dictionary["Radiohead"] = #imageLiteral(resourceName: "radiohead")
    dictionary["Muse"] = #imageLiteral(resourceName: "muse")
    dictionary["Daughter"] = #imageLiteral(resourceName: "daughter")
    dictionary["Clairo"] = #imageLiteral(resourceName: "clairo")
    dictionary["Zaumazein"] = #imageLiteral(resourceName: "zauma")
}

// SAVE DATA USER
func saveData(){
    
    artistsData.removeAll()
    placesData.removeAll()
    datesData.removeAll()
    imagesData.removeAll()
    
    for i in boughtTickets{
        
        artistsData.append(i.title)
        placesData.append(i.place)
        datesData.append(i.date)
        //imagesData.append(String?(i.image.accessibilityIdentifier!)!)
        
    }
    UserDefaults.standard.set(artistsData, forKey: keyArtist)
    UserDefaults.standard.set(placesData, forKey: keyPlace)
    UserDefaults.standard.set(datesData, forKey: keyDate)
    UserDefaults.standard.set(imagesData, forKey: keyImage)
    
    UserDefaults.standard.synchronize()
    
}

// SET DATA USER
func setData(){
    setDictionary()
    let settingArtist = UserDefaults.standard.array(forKey: keyArtist)
    
    let settingPlace = UserDefaults.standard.array(forKey: keyPlace)
    
    let settingDate = UserDefaults.standard.array(forKey: keyDate)

    
    UserDefaults.standard.synchronize()
    
    if settingArtist == nil {
        return
    }
    
    for i in 0...(settingArtist?.count)! - 1 {
        
        boughtTickets.append(Event(title: settingArtist![i] as! String, category: Event.ConcertType.indieRock, date: settingDate![i] as! String, place: settingPlace![i] as! String, image: dictionary[settingArtist![i] as! String]! , tickets: 0, price: 0))
    }
    
}
