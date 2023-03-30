//
//  ViewController.swift
//  caculate
//
//  Created by MacbookPro on 2022/12/8.
//

import UIKit

class ViewController: UIViewController {
    
    //拉outlet顯示指令
    //拉%選項(10% or 15%)percentage，型別為UISegmentedControl
    @IBOutlet weak var percentage: UISegmentedControl!
    //拉稅前日幣的textfield為priceTextField，型別為UITextField
    @IBOutlet weak var priceTextField: UITextField!
    //拉稅後台幣的label為texafterLabel，型別為UILabel
    @IBOutlet weak var texafterLabel: UILabel!
    //拉標語的label為titleLabel，型別為UILabel
    @IBOutlet weak var titleLabel: UILabel!
    
    //設變數gst(消費稅)為0.1(10%)
    var gst = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //設func為erase，用途為清除一切delete後 顯示原來的畫面(字串)
    func erase(){
        //物件.屬性=生出的東西
        //用屬性text顯示TextField及Label上的""，"0"，"▼今晚我想算點......"等字串
        priceTextField.text = ""
        texafterLabel.text = "0"
        titleLabel.text = "▼今晚我想算點......"
    }
    
    
    
    //拉DeleteBtn的Action為eraseAllButton，型別sender可為任何Any
    @IBAction func eraseAllButton(_ sender: Any) {
        //用if為條件，當物件percentage的.屬性selectedSegmentIndex相等(==)0時
        if percentage.selectedSegmentIndex == 0{
            //Label顯示"10% GST (匯率0.22)"
            //物件titleLabel的.屬性text為"10% GST (匯率0.22)"
            titleLabel.text = "10% GST (匯率0.22)"
            
            //function 名稱 + () : 執行指令，呼叫 function
            //呼叫erase
            erase()
        }
        if percentage.selectedSegmentIndex == 1{
            titleLabel.text = "15% GST (匯率0.22)"
            erase()
        }
    }
    
    
    //拉segmentedControl的Action為percentage，型別sender為指定的UISegmentedControl
    @IBAction func percentage(_ sender: UISegmentedControl) {
        //用if為條件，當物件percentage的.屬性selectedSegmentIndex相等(==)0時
        if percentage.selectedSegmentIndex == 0{
            //Label顯示"10% GST (匯率0.22)"
            //物件titleLabel的.屬性text為"10% GST (匯率0.22)"
            titleLabel.text = "10% GST (匯率0.22)"
        }
        if percentage.selectedSegmentIndex == 1{
            titleLabel.text = "15% GST (匯率0.22)"
        }
        
    }
    
    
    //拉“稅後換算”的Action為calculateButton，型別sender可為任何Any
    @IBAction func calculateButton(_ sender: Any) {
        //當物件percentage的.屬性selectedSegmentIndex與0相等(==)時
        if percentage.selectedSegmentIndex == 0{
            //gst(消費稅)會=0.1(10%)
            gst = 0.1
       
        //物件.屬性=生出的東西
        //text的型別為var text: String?，須加!才能進行
        let priceText = priceTextField.text!
        //讓priceText從字串變成浮點數
        let price = Double(priceText)
        //當price 不等於(!=)"沒有值""nil"的時候
        //也就是price有值的時候
        if price != nil{
            //設常數priceafter為price! 乘 1.1(10%) 乘 0.22(換算台幣)
            let priceafter = price! * 1.1 * 0.22
            //生出字串
            //"%.2f"，%小數點後f第幾位
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
        //呼叫物件的方法:物件變數＋.＋func+( 參數 )
        //顯示計算
        view.endEditing(true)
        print()
    }
    
    //點空白處收鍵盤
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
}
