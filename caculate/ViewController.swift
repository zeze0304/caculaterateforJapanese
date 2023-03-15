//
//  ViewController.swift
//  caculate
//
//  Created by MacbookPro on 2022/12/8.
//

import UIKit

class ViewController: UIViewController {
    
     
    
    @IBOutlet weak var percentage: UISegmentedControl!
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var texafterLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var gst = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func erase(){
        priceTextField.text = ""
        texafterLabel.text = "0"
        titleLabel.text = "▼今晚我想算點......"
    }
    
    
    
    
    @IBAction func eraseAllButton(_ sender: Any) {
        if percentage.selectedSegmentIndex == 0{
            titleLabel.text = "10% GST (匯率0.22)"
            erase()
        }
        if percentage.selectedSegmentIndex == 1{
            titleLabel.text = "15% GST (匯率0.22)"
            erase()
        }
    }
    
    
    
    @IBAction func percentage(_ sender: UISegmentedControl) {
        if percentage.selectedSegmentIndex == 0{
            titleLabel.text = "10% GST (匯率0.22)"
        }
        if percentage.selectedSegmentIndex == 1{
            titleLabel.text = "15% GST (匯率0.22)"
        }
        
    }
    
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        if percentage.selectedSegmentIndex == 0{
            gst = 0.1
       
        
        let priceText = priceTextField.text!
        let price = Double(priceText)
        if price != nil{
            let priceafter = price! * 1.1 * 0.22
            texafterLabel.text = String(format: "%.2f", priceafter )
        }
        }
        
        if percentage.selectedSegmentIndex == 1{
            gst = 0.15
       
        
        let priceText = priceTextField.text!
        let price = Double(priceText)
        if price != nil{
            let priceafter = price! * 1.15 * 0.22
            texafterLabel.text = String(format: "%.2f", priceafter )
        }
        }
        view.endEditing(true)
    }
    
    
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
}
