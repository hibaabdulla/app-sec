//
//  ViewController.swift
//  app sec
//
//  Created by Hiba on 11/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    struct country: Codable {
       let countryName : String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     get()
    }
    func get() {
    
        let countryNameURL = "http://api.geonames.org/countryCodeJSON?lat=47.03&lng=10.2&username=hibaabdulla"
       
        guard let url = URL(string: countryNameURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, error) in
    
            do {
                let Details = try JSONDecoder().decode(country.self, from: data!)
                                DispatchQueue.main.async {
                                    print(Details.countryName)
                                  //  print(urlString)
                                    
                                }
                            } catch {}
                        }.resume()
                    }

}

