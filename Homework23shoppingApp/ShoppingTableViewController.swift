//
//  ShoppingTableViewController.swift
//  Homework23shoppingApp
//
//  Created by 黃柏嘉 on 2021/11/26.
//

import UIKit

class ShoppingTableViewController: UITableViewController,UITextFieldDelegate{
    
    //橫幅圖片
    @IBOutlet weak var bannerScrollView: UIScrollView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    //variable
    var kdCount = 0
    var zionCount = 0
    var pgCount = 0
    var jordanCount = 0
    var kyrieCount = 0
    var freakCount = 0
    let formatter = NumberFormatter()
    var timer:Timer?
    var bannerIndex = 0

    //TextField
    @IBOutlet weak var kdTextField: UITextField!
    @IBOutlet weak var zionTextField: UITextField!
    @IBOutlet weak var pgTextField: UITextField!
    @IBOutlet weak var jordanTextField: UITextField!
    @IBOutlet weak var kyrieTextField: UITextField!
    @IBOutlet weak var freakTextField: UITextField!
    @IBOutlet var textFieldArray: [UITextField]!
    
    //stepper
    @IBOutlet weak var kdStepper: UIStepper!
    @IBOutlet weak var zionStepper: UIStepper!
    @IBOutlet weak var pgStepper: UIStepper!
    @IBOutlet weak var jordanStepper: UIStepper!
    @IBOutlet weak var kyrieStepper: UIStepper!
    @IBOutlet weak var freakStepper: UIStepper!
    @IBOutlet var stepperArray: [UIStepper]!
    
    //結帳清零
    @IBOutlet weak var payBackView: UIView!
    @IBOutlet weak var sumLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoBanner), userInfo: nil, repeats: true)
        
        payBackView.layer.cornerRadius = 15
        bannerScrollView.delegate = self
        
        
    }
    
    //變更數量
    @IBAction func changeQuantity(_ sender: UIStepper) {
        switch sender.tag{
        case 0:
            kdCount = Int(kdStepper.value)
            kdTextField.text = "\(kdCount)"
        case 1:
            zionCount = Int(zionStepper.value)
            zionTextField.text = "\(zionCount)"
        case 2:
            pgCount = Int(pgStepper.value)
            pgTextField.text = "\(pgCount)"
        case 3:
            jordanCount = Int(jordanStepper.value)
            jordanTextField.text = "\(jordanCount)"
        case 4:
            kyrieCount = Int(kyrieStepper.value)
            kyrieTextField.text = "\(kyrieCount)"
        case 5:
            freakCount = Int(freakStepper.value)
            freakTextField.text = "\(freakCount)"
        default:
            return
        }
        calculate()
    }
    
    
    //計算總價
    func calculate(){
        let sum = (kdCount*4950)+(zionCount*4000)+(pgCount*3800)+(jordanCount*4900)+(kyrieCount*4200)+(freakCount*3399)
        formatter.locale = Locale(identifier: "zh_TW")
        formatter.numberStyle = .currencyISOCode
        formatter.maximumFractionDigits = 0
        sumLabel.text = formatter.string(from: NSNumber(value: sum))!
    }
    //結帳清空
    @IBAction func clearAll(_ sender: UIButton) {
        kdCount = 0
        zionCount = 0
        pgCount = 0
        jordanCount = 0
        kyrieCount = 0
        freakCount = 0
        for i in textFieldArray{
            i.text = "0"
        }
        for i in stepperArray{
            i.value = 0
        }
        calculate()
    }

    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/414)
        bannerPageControl.currentPage = page
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCart"{
            if let cartTVC = segue.destination as? CartTableViewController{
                cartTVC.kdCount = kdCount
                cartTVC.zionCount = zionCount
                cartTVC.pgCount = pgCount
                cartTVC.jordanCount = jordanCount
                cartTVC.kyriecount = kyrieCount
                cartTVC.freakCount = freakCount
            }
        }
    }
    @objc func autoBanner(){
        bannerScrollView.contentOffset.x = CGFloat(bannerIndex*414)
        bannerPageControl.currentPage = bannerIndex
        if bannerIndex < 4{
            bannerIndex += 1
        }else{
            bannerIndex = 0
        }
    }
}
