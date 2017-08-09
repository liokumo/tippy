//
//  ViewController.swift
//  tippy
//
//  Created by LiangYiyun on 8/7/17.
//  Copyright © 2017 LiangYiyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var tipView: UIView!
    
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var taxTitleLabel: UILabel!
    var percentageNumbers = [18, 20, 25, 0, 9];
    var showTax : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        self.billField.center.y = 200;
        self.tipControl.center.y = 400
        self.tipView.center.y = 500
        self.billField.placeholder = getSymbolForCurrencyCode(code: Locale.current.currencyCode!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "percentage") != nil {
            self.percentageNumbers = defaults.object(forKey: "percentage") as! Array
        } else {
            defaults.set(percentageNumbers, forKey: "percentage")
            defaults.synchronize()
        }
        
        if defaults.object(forKey: "segement_index") != nil {
            tipControl.selectedSegmentIndex = defaults.object(forKey: "segement_index") as! Int
        }
        
        if defaults.object(forKey: "bill_amount") != nil {
            billField.text = defaults.object(forKey: "bill_amount") as? String
        }
        for i in 0..<tipControl.numberOfSegments {
            tipControl .setTitle(String(format:"%d%%", percentageNumbers[i]), forSegmentAt: i)
        }
        
        if defaults.object(forKey: "tax") != nil{
            showTax = defaults.object(forKey: "tax") as! Bool
        }
        self.taxLabel.isHidden = !showTax
        self.taxTitleLabel.isHidden = !showTax
        calculate()
    }

    @IBAction func calculateTip(_ sender: Any) {
        calculate()
    }
    
    func getSymbolForCurrencyCode(code: String) -> String? {
        let locale = NSLocale(localeIdentifier: code)
        return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
    }
    
    func calculate() {
        let fmt = NumberFormatter()
        fmt.numberStyle = .currency
        fmt.locale = NSLocale(localeIdentifier: Locale.current.identifier) as Locale!
        if (billField.text?.isEmpty)! {
            showBillTextFieldOnly()
        } else {
            showAll()
        }
        let bill = Double(billField.text!) ?? 0
        var tax = 0.0
        if showTax {
            tax = bill * (Double(percentageNumbers[4]) / 100.0)
        }
        let tip = (bill - tax) * (Double(percentageNumbers[tipControl.selectedSegmentIndex]) / 100.0)
        let total = bill + tip
        
        tipLabel.text = fmt.string(from: tip as NSNumber)
        totalLabel.text = fmt.string(from: total as NSNumber)
        taxLabel.text = fmt.string(from: tax as NSNumber)
        
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "segement_index")
        defaults.set(billField.text, forKey: "bill_amount")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabels()
    }
    
    func showBillTextFieldOnly() {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.billField.center.y = 200;
            self.tipControl.center.y = 500
            self.tipView.center.y = 500
        }, completion: { finished in
        })
    }
    
    func showAll() {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.billField.center.y = 124;
            self.tipControl.center.y = 184
            self.tipView.center.y = 285
        }, completion: { finished in
        })
    }
}

