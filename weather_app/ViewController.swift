//
//  ViewController.swift
//  weather_app
//
//  Created by Admin on 3/9/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var template: UILabel!
    
    @IBOutlet weak var templec: UILabel!
    @IBOutlet weak var quotes: UILabel!
    var quotestext = ["since we can not change reality, let us change the eyes which see reality.", "without a struggle, there can be no progress", "if you don't like something, change it. if you can't change it, change your attitude."]
    var citytext =  ["Ho Chi Minh",
                     "Sai Gon",
                     "france"]
    var backgroundimage = ["Blood", "Moon", "Sun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func refresh(_ sender: Any) {
        let cityIndex = Int(arc4random_uniform(UInt32(citytext.count)))
        city.text = citytext[cityIndex]
        
        let quotesIndex = Int(arc4random_uniform(UInt32(quotestext.count)))
        quotes.text = quotestext[quotesIndex]
        
        let backgroundIndex = Int(arc4random_uniform(UInt32(backgroundimage.count)))
        background.image = UIImage.init(named: backgroundimage[backgroundIndex])
        getTemp()
    }
    
    func getTemp() -> Void {
        let randomNumber: Double = Double(String(format: "%2.1f", tempRandom()))!
        
        if templec.text == "F"{
            var l = self.tempRandom()
            l = (l * 1.8) + 32
            
        } else{
            var k = self.tempRandom()
            k = (k - 32) / 1.800
        }
        template.text = String(randomNumber)
    }
    
    func tempRandom() -> Double {
        return Double(arc4random_uniform(39) + 30) + Double(arc4random()) / Double(INT32_MAX)
    }
    
    var a = true
    @IBAction func templeF(_ sender: Any) {
        let h = self.template.text
        var g : Double = Double(h!)!
                if a == true {
            templec.text = "F"
                    g = g *  1.8 + 32
                    print(g)
            a = false
        } else {
            templec.text = "C"
                    g = (g - 32) / 1.8
                    print(g)
            a = true
        }
        
        
    }
}

