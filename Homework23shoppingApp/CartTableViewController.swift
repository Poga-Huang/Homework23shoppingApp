//
//  CartTableViewController.swift
//  Homework23shoppingApp
//
//  Created by 黃柏嘉 on 2021/11/26.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    //Label
    @IBOutlet weak var kdMoneyLabel: UILabel!
    @IBOutlet weak var zionMoneyLabel: UILabel!
    @IBOutlet weak var pgMoneyLabel: UILabel!
    @IBOutlet weak var jordanMoneyLabel: UILabel!
    @IBOutlet weak var kyrieMoneyLabel: UILabel!
    @IBOutlet weak var freakMoneyLabel: UILabel!
    @IBOutlet weak var kdQty: UILabel!
    @IBOutlet weak var zionQty: UILabel!
    @IBOutlet weak var pgQty: UILabel!
    @IBOutlet weak var jordanQty: UILabel!
    @IBOutlet weak var kyrieQty: UILabel!
    @IBOutlet weak var freakQty: UILabel!
    
    //variable
    var kdCount:Int?
    var zionCount:Int?
    var pgCount:Int?
    var jordanCount:Int?
    var kyriecount:Int?
    var freakCount:Int?
    let formatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "zh_TW")
        formatter.numberStyle = .currencyISOCode
        
        
        if let kdCount = kdCount,let zionCount = zionCount,let pgCount = pgCount,let jordanCount = jordanCount,let kyriecount = kyriecount,let freakCount = freakCount{
            
            kdMoneyLabel.text = formatter.string(from: NSNumber(value: kdCount*4900))
            kdQty.text = String(kdCount)
            zionMoneyLabel.text = formatter.string(from: NSNumber(value: zionCount*4000))
            zionQty.text = String(zionCount)
            pgMoneyLabel.text = formatter.string(from: NSNumber(value: pgCount*3800))
            pgQty.text = String(pgCount)
            jordanMoneyLabel.text = formatter.string(from: NSNumber(value: jordanCount*4900))
            jordanQty.text = String(jordanCount)
            kyrieMoneyLabel.text = formatter.string(from: NSNumber(value: kyriecount*4200))
            kyrieQty.text = String(kyriecount)
            freakMoneyLabel.text = formatter.string(from: NSNumber(value: freakCount*3399))
            freakQty.text = String(freakCount)
        }
        
    }

    

}
