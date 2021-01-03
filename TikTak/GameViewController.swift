//
//  GameViewController.swift
//  TikTak
//
//  Created by David Dahlman on 2021-01-03.
//

import UIKit

class GameViewController: UIViewController {

    var difficulty: String?
    
    @IBOutlet weak var gameText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameText.text = "difficulty"
    }
    

  
    @IBAction func exitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    
    }
    
}
