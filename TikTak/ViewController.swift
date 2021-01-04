//
//  ViewController.swift
//  TikTak
//
//  Created by David Dahlman on 2020-12-25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{


    @IBOutlet weak var pickerData: UIPickerView!
    
    @IBOutlet weak var labelText: UILabel!
    
    private var gameDifficulty = ["Hard","Normal","Easy"]
    private let userDefaultRowKey = "defaultsPickerRow"
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    


    @IBAction func startButton(_ sender: UIButton) {
        print("tape")
        self.performSegue(withIdentifier: "goToGame", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.difficulty = gameDifficulty[selectedRow]
        }
    }
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gameDifficulty.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return gameDifficulty[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }

}

