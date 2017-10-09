//
//  candlestickView.swift
//  candlestickCharts
//
//  Created by Ryan Brazones on 10/8/17.
//  Copyright © 2017 Ryan Brazones. All rights reserved.
//

import UIKit

@IBDesignable

class candlestickView: UIView {

    
    /*
     *  Public API
     */
    
    @IBInspectable
    var numberOfCandles: CGFloat = 20
    
    @IBInspectable
    var lineWidth: CGFloat = 2
    
    @IBInspectable
    var color: UIColor = UIColor.green
    
    var data: [candleData] = [] {didSet {setNeedsDisplay()}}
    
    /*
     *  Private implementation
     */
    
    private var candleWidth: CGFloat {
        return (bounds.maxY / numberOfCandles) * 0.95
    }
    
    private var candleSpacing: CGFloat {
        return bounds.maxX / numberOfCandles
    }
    

    
    private func drawBar(at location: CGFloat, with data: candleData) -> UIBezierPath {
        
        let barX = location - candleWidth / 2
        let barY = (data.openPrice < data.closePrice) ? data.openPrice : data.closePrice
        let barHeight = CGFloat(abs(data.openPrice - data.closePrice))
        let barWidth = candleWidth
        let path = CGRect(x: barX, y: barY, width: barWidth, height: barHeight)
    
        let bezier: UIBezierPath = UIBezierPath(rect: path)
        bezier.lineWidth = lineWidth
        
        return bezier
    }
    
    override func draw(_ rect: CGRect){

        print("Bounds x = \(bounds.maxX)")
        print("CandleSpacing = \(candleSpacing)")
        
        
        var currentCandle: CGFloat = candleSpacing / 2
        
        /*
        for i in 1...data.count {
            if i <= data.count {

                //color.set()
                //drawBar(at: currentCandle, with: data[i]).stroke()
                
                currentCandle += candleSpacing
            }
            
            
        }
        */
        
        for cd in data {
            color.set()
            drawBar(at: currentCandle, with: cd).stroke()
            currentCandle += candleSpacing
        }
        
    }
    
    // fill up with test data
    

}
