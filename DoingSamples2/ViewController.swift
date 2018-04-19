//
//  ViewController.swift
//  DoingSamples2
//
//  Created by Sundir Talari on 02/04/18.
//  Copyright © 2018 Sundir Talari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://jsonplaceholder.typicode.com/todos")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {return}
            
            do {
        let json = try JSONSerialization.jsonObject(with: data, options: []) as![Any]
                //print(json)
                print("\(((json)[0] as![String: Any])["title"]!)")
                print("\(((json)[0] as![String: Any])["completed"] as! Bool)")
                print("\(((json)[0] as![String: Any])["userId"]!)")
                print("\(((json)[0] as![String: Any])["id"]!)")
                
                
            }catch {
                print("json error: \(error.localizedDescription)")
            }
            
        }.resume()
        
    }

}

