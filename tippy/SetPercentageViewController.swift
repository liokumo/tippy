//
//  SetPercentageViewController.swift
//  tippy
//
//  Created by LiangYiyun on 8/8/17.
//  Copyright © 2017 LiangYiyun. All rights reserved.
//

import UIKit

class SetPercentageViewController: UIViewController {
    
    var percentageLabelString: String?
    var percentage: Int = 0
    var index: Int = 0
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var percentageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentageTextField.becomeFirstResponder()
        percentageLabel.text = percentageLabelString
        self.title = "Set Percentage"
        
        // Do any additional setup after loading the view.
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(SetPercentageViewController.savePercentage));
        self.navigationItem.rightBarButtonItem = doneItem;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func savePercentage() {
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "percentage") != nil{
            var percentageNumbers = defaults.object(forKey: "percentage") as! Array<Int>
            percentageNumbers[index] = Int(percentageTextField.text!) ?? percentage
            defaults.set(percentageNumbers, forKey: "percentage")
            defaults.synchronize()
        }
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
