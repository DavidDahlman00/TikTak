//
//  GameViewController.swift
//  TikTak
//
//  Created by David Dahlman on 2021-01-03.
//

import UIKit

class GameViewController: UIViewController {
   

    var difficulty: String?
    var nameplayer1: String?
    var nameplayer2: String?
    var numPlayers: String?
    
    
    @IBOutlet weak var gameText: UILabel!
    
    @IBOutlet weak var player1label: UILabel!
    @IBOutlet weak var player2label: UILabel!
    
    
    @IBOutlet weak var square1: UIImageView!
    @IBOutlet weak var square2: UIImageView!
    @IBOutlet weak var square3: UIImageView!
    @IBOutlet weak var square4: UIImageView!
    @IBOutlet weak var square5: UIImageView!
    @IBOutlet weak var square6: UIImageView!
    @IBOutlet weak var square7: UIImageView!
    @IBOutlet weak var square8: UIImageView!
    @IBOutlet weak var square9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gameText.text = difficulty
        gameText.text = numPlayers
        var madeUpPlayerNames = ["Magnus", "Fabiano", "Liren", "Ian", "Maxime", "Alexander", "Levon", "Wesley", "Teimour", "Anish"]
        if nameplayer1 == "" {
            player1label.text = madeUpPlayerNames.randomElement()
        }else{
            player1label.text = nameplayer1
        }
        if nameplayer2 == "" {
            player2label.text = madeUpPlayerNames.randomElement()
        }else{
            player2label.text = nameplayer2
        }
    }
    
    func minmax(game: Game) -> Int {
        if game.winner == "goOnPlay" {
            if game.player == 1 {
                var bestResult = -10
                for square in game.findEmptySquares() {
                    var newGame = game
                    newGame.setPosition(row: square[0], col: square[1])
                    let result = minmax(game: newGame)
                    bestResult = max(result, bestResult)
                }
                return bestResult
            } else{
                var bestResult = 10
                for square in game.findEmptySquares() {
                    var newGame = game
                    newGame.setPosition(row: square[0], col: square[1])
                    let result = minmax(game: newGame)
                    bestResult = min(result, bestResult)
                    }
                return bestResult
            }
        } else{
            switch game.winner {
            case "player1":
                return 1
            case "player2":
                return -1
            default:
                return 0
            }
        }
    }
    
    func computerBestMove(game: Game) -> [Int] {
        let posibleMoves = game.findEmptySquares()
        var bestMove = [posibleMoves[0]]
        var bestResMax = -100
        var bestResMin = 100
        for square in posibleMoves {
            var tempGame = game
            tempGame.setPosition(row: square[0], col: square[1])
            if game.player == 1 {
                if minmax(game: tempGame) > bestResMax {
                    bestResMax = minmax(game: tempGame)
                    bestMove = [square]
                }else if minmax(game: tempGame) == bestResMax {
                    bestMove.append(square)
                }
            }else{
                if minmax(game: tempGame) < bestResMin {
                    bestResMin = minmax(game: tempGame)
                    bestMove = [square]
                }else if minmax(game: tempGame) == bestResMin {
                    bestMove.append(square)
                }
            }
        }
        return bestMove.randomElement()!
    }
  
    @IBAction func exitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    
    }
    
}
