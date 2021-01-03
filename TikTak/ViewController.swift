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
    private var gameDifficulty: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameDifficulty =  ["Hard","Normal","Easy"]
    }
    


    @IBAction func startButton(_ sender: UIButton) {
        print("tape")
      
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! GameViewController
            destinationVC.gameText.text = "tested"
            
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

}

