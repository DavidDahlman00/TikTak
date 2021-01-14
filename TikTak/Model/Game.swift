//
//  Game.swift
//  TikTak
//
//  Created by David Dahlman on 2021-01-07.
//

import Foundation

struct Game {
    var player: Int = 1
    var bord: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    var move: Int = 0
    var winner: String {
        var winnerArray = [Int]()
        for row in 0...2 {
            var sum = 0
            for col in 0...2 {
                sum += bord[row][col]
            }
            winnerArray.append(sum)
    }
        for col in 0...2 {
            var sum = 0
            for row in 0...2 {
                sum += bord[row][col]
            }
            winnerArray.append(sum)
    }
        winnerArray.append(bord[0][0] + bord[1][1] + bord[2][2])
        winnerArray.append(bord[0][2] + bord[1][1] + bord[2][0])
        if winnerArray.contains(6) {
            return "player1"
        }else if winnerArray.contains(15){
            return "player2"
        }else if winnerArray.contains(where: [0, 2, 4, 5, 10].contains){
            return "goOnPlay"
        }else{
            return "draw"
        }
    }
    
    
    func getPosition(row: Int, col: Int) -> Int {
        return bord[row][col]
    }
    
    mutating func setPosition(row: Int, col: Int){
        if bord[row][col] == 0 {
            if player == 1 {
                bord[row][col] = 2
                player = 2
                move += 1
            }else{
                bord[row][col] = 5
                player = 1
                move+=1
            }
        }
    }
    
    func findEmptySquares() -> [[Int]] {
        var emptySquares = [[Int]]()
        for row in 0...2 {
            for col in 0...2 {
                if self.bord[row][col] == 0 {
                    emptySquares.append([row, col])
                }
            }
        }
        return emptySquares
    }
    
    mutating func randomMove() -> [Int]? {
        let posibleMoves = findEmptySquares()
        if !posibleMoves.isEmpty && winner == "goOnPlay"{
            let choosenMove = posibleMoves.randomElement()
            setPosition(row: choosenMove![0], col: choosenMove![1])
            return choosenMove
        }
        return [-1,-1]
    }
}
    

   
    
    
