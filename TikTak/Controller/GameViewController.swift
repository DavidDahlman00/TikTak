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
    var scorePlayer1: Int = 0
    var scorePlayer2: Int = 0
    var scoreDraw: Int = 0
    var boxClickedReturn = "none"
    var game = Game()
    var madeUpPlayerNames = ["Magnus", "Fabiano", "Liren", "Ian", "Maxime", "Alexander", "Levon", "Wesley", "Teimour", "Anish"]
    
    var iconList = [#imageLiteral(resourceName: "iconfinder_Grandfather_3231121"), #imageLiteral(resourceName: "iconfinder_Daughter_3231126"), #imageLiteral(resourceName: "iconfinder_Brother_3231124-3"), #imageLiteral(resourceName: "iconfinder_Grandmother_3231123"), #imageLiteral(resourceName: "iconfinder_Uncle_3231127")]
    var player1Name: String = ""
    var player2Name: String = ""
    var icon1 = #imageLiteral(resourceName: "iconfinder_Grandfather_3231121")
    var icon2 = #imageLiteral(resourceName: "iconfinder_Grandfather_3231121")
    
    @IBOutlet weak var player1label: UILabel!
    @IBOutlet weak var player2label: UILabel!
    
    @IBOutlet weak var drawlabel: UILabel!
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    @IBOutlet weak var box3: UIImageView!
    @IBOutlet weak var box4: UIImageView!
    @IBOutlet weak var box5: UIImageView!
    @IBOutlet weak var box6: UIImageView!
    @IBOutlet weak var box7: UIImageView!
    @IBOutlet weak var box8: UIImageView!
    @IBOutlet weak var box9: UIImageView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            if nameplayer1 == "" {
                player1Name = madeUpPlayerNames.randomElement()!
            }else{
                player1Name = nameplayer1!
            }
        if nameplayer2 == "" {
            player2Name = madeUpPlayerNames.randomElement()!
        }else{
            player2Name = nameplayer2!
        }
        let randomIndex = makeListIndex()
        icon1 = iconList[randomIndex[0]]
        icon2 = iconList[randomIndex[1]]
        setNames()
        createTap(on: box1, type: .one)
        createTap(on: box2, type: .two)
        createTap(on: box3, type: .three)
        createTap(on: box4, type: .four)
        createTap(on: box5, type: .five)
        createTap(on: box6, type: .six)
        createTap(on: box7, type: .seven)
        createTap(on: box8, type: .eight)
        createTap(on: box9, type: .nine)
        
      
    }
    
    func makeListIndex() -> [Int] {
        return (0...1).map { _ in .random(in: 0...4) }
    }
    
    func setNames()  {
        drawlabel.text = "draw: \(scoreDraw)"
        player1label.text = "\(player1Name): \(scorePlayer1)"
        player2label.text = "\(player2Name): \(scorePlayer2)"
    }
    
    func clearBoxes()  {
        box1.image = #imageLiteral(resourceName: "square_PNG24")
        box2.image = #imageLiteral(resourceName: "square_PNG24")
        box3.image = #imageLiteral(resourceName: "square_PNG24")
        box4.image = #imageLiteral(resourceName: "square_PNG24")
        box5.image = #imageLiteral(resourceName: "square_PNG24")
        box6.image = #imageLiteral(resourceName: "square_PNG24")
        box7.image = #imageLiteral(resourceName: "square_PNG24")
        box8.image = #imageLiteral(resourceName: "square_PNG24")
        box9.image = #imageLiteral(resourceName: "square_PNG24")
    }
    
    func createTap(on imageView: UIImageView, type box: Box) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.boxClicked(_:)))
        tap.name = box.rawValue
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func boxClicked(_ sender: UITapGestureRecognizer) {
        var pos: [Int]{
            switch sender.name {
            case "one":
                return [0,0]
            case "two":
                return [0,1]
            case "three":
                return [0,2]
            case "four":
                return [1,0]
            case "five":
                return [1,1]
            case "six":
                return [1,2]
            case "seven":
                return [2,0]
            case "eight":
                return [2,1]
            case "nine":
                return [2,2]
            default:
                return [-1,-1]
            }
        }
     
        if game.getPosition(row: pos[0], col: pos[1]) == 0 {

            let selectedBox = getBox(from: sender.name ?? "")
            if game.player == 1 {
                selectedBox.image = icon1
                
            } else {
                selectedBox.image = icon2
            }
            game.setPosition(row: pos[0], col: pos[1])
            if numPlayers == Optional("1-player") && game.player == 2 && game.winner == "goOnPlay"{
                makeComputerMove()
            }
            
        }

        if game.winner != "goOnPlay" {
           var seriouslyWhyDefaultInSwitchStatments = 0
            switch game.winner {
            case "player1":
                scorePlayer1 += 1
            case "player2":
                scorePlayer2 += 1
            case "draw":
                scoreDraw += 1
            default:
                seriouslyWhyDefaultInSwitchStatments += 1
            }
           setNames()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.newGame()
            }
        }
    }
    
    func newGame() {
        clearBoxes()
        game = Game()
    }
    
    enum Box: String {
        case one, two, three, four, five, six, seven, eight, nine
    }
    
    func getBox(from name: String) -> UIImageView {
        let box = Box(rawValue: name) ?? .one
        
        switch box {
        case .one:
            return box1
        case .two:
            return box2
        case .three:
            return box3
        case .four:
            return box4
        case .five:
            return box5
        case .six:
            return box6
        case .seven:
            return box7
        case .eight:
            return box8
        case .nine:
            return box9
        }
    }
    
    func findBoxByPosition(pos: [Int]) -> UIImageView {
        
        switch pos {
        case [0,0]:
            return box1
        case [0,1]:
            return box2
        case [0,2]:
            return box3
        case [1,0]:
            return box4
        case [1,1]:
            return box5
        case [1,2]:
            return box6
        case [2,0]:
            return box7
        case [2,1]:
            return box8
        case [2,2]:
            return box9
        default:
            return box9
        }
    }
    
    func makeComputerMove() {
        let move: [Int]
        if difficulty == "Easy" {
            move = game.findEmptySquares().randomElement()!
        }
        else if difficulty == "Normal" {
            let number = Int.random(in: 1...10)
            if number > 3 {
                move = computerBestMove(game: game)
            }else{
                move = game.findEmptySquares().randomElement()!
            }
        }else{
            move = computerBestMove(game: game)
        }
        
        let selectedBox = findBoxByPosition(pos: move)
        selectedBox.image = icon2
        game.setPosition(row: move[0], col: move[1])
       
    }
    
    
    //#### functions that should be in modell but has to be elsewhere because of circle recursion. Sory for bad code ####
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

    @IBAction func exitFunc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
