//
//  SettingsTableViewController.swift
//  tippy
//
//  Created by LiangYiyun on 8/8/17.
//  Copyright © 2017 LiangYiyun. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let tableCellLabels = ["First Percentage", "Seconde Percentage", "Third Percentage", "", "Tax Rate"];
    var percentageNumbers = [18, 20, 25, 0, 9];
    
    @IBOutlet weak var taxPercentage: UILabel!
    @IBOutlet weak var firstPercentage: UILabel!
    @IBOutlet weak var secondPercentage: UILabel!
    @IBOutlet weak var thirdPercentage: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var taxSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "tax") != nil{
            taxSwitch.isOn = defaults.object(forKey: "tax") as! Bool
        }
        taxLabel.isEnabled = taxSwitch.isOn
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 && indexPath.section == 1 {
            return
        }
        if indexPath.row == 1 && indexPath.section == 1 && !taxSwitch.isOn {
            let alertController = UIAlertController(title: "Oops", message:
                "Need to enable exclude tax rate", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        } else {
            let index = indexPath.section * 3 + indexPath.row
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetPercentageViewController") as? SetPercentageViewController {
                viewController.percentageLabelString = tableCellLabels[index]
                viewController.percentage = percentageNumbers[index]
                viewController.index = index
                if let navigator = navigationController {
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
    }
    
    func updateLabels() {
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "percentage") != nil{
            self.percentageNumbers = defaults.object(forKey: "percentage") as! Array
        } else {
            defaults.set(percentageNumbers, forKey: "percentage")
            defaults.synchronize()
        }
        firstPercentage.text = String(format: "%d%%", percentageNumbers[0])
        secondPercentage.text = String(format: "%d%%", percentageNumbers[1])
        thirdPercentage.text = String(format: "%d%%", percentageNumbers[2])
        taxPercentage.text = String(format: "%d%%", percentageNumbers[4])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabels()
    }
    
    @IBAction func turnTaxSwitch(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(taxSwitch.isOn, forKey: "tax")
        defaults.synchronize()
        taxLabel.isEnabled = taxSwitch.isOn
    }
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
    */
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
