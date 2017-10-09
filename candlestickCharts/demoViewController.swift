//
//  ViewController.swift
//  candlestickCharts
//
//  Created by Ryan Brazones on 10/8/17.
//  Copyright © 2017 Ryan Brazones. All rights reserved.
//

import UIKit

class demoViewController: UIViewController {
    
    @IBOutlet weak var testCandle: candlestickView!
    
    @IBAction func runTest(_ sender: UIButton) {
        for i in 1...20 {
            testCandle?.data.append(candleData())
            print(i)
        }
    }
}

