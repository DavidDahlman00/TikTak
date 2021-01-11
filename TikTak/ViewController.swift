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
    
    @IBOutlet weak var player1name: UITextField!
    @IBOutlet weak var player2name: UITextField!
    
    private var gameDifficulty = ["Hard","Normal","Easy"]
    private var numberOfPlayers = ["1-player", "2-players"]
    private let userDefaultRowKey = "defaultsPickerRow"
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1name.text = ""
        player2name.text = ""
        
    }
    


    @IBAction func startButton(_ sender: UIButton) {
        print("tape")
        self.performSegue(withIdentifier: "goToGame", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.difficulty = gameDifficulty[selectedRow]
            destinationVC.numPlayers = numberOfPlayers[selectedRow]
            destinationVC.nameplayer1 = player1name.text
            destinationVC.nameplayer2 = player2name.text
            
            
            
            
            
        }
    }
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numberOfPlayers.count
        }
        return gameDifficulty.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return numberOfPlayers[row]
        }
        return gameDifficulty[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }

}

