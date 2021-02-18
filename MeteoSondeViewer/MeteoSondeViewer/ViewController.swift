//
//  ViewController.swift
//  MeteoSondeViewer
//
//  Created by noje on 18/02/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        //API Endpoint
        let urlString = "http://192.168.0.39"
        let url = URL(string: urlString)
        
        guard url != nil else {
            debugPrint("URL is nil")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            //check for errors
            if error == nil && data != nil {
                //parse JSON
                let decoder = JSONDecoder()
                
                do {
                    let sondeData = try decoder.decode(SondeData.self, from: data!)
                    print("This is JSON result -->> \n\(sondeData)")
                    
                } catch {
                    debugPrint("Error in JSON parsing !")
                }
            }
        }
        //Make the API Call
        dataTask.resume()
        
    }
}

