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
    var winner: String = "goOnPlay"
    var move: Int = 0
    
    func getPosition(row: Int, col: Int) -> Int {
        return bord[row][col]
    }
    
    mutating func setPosition(row: Int, col: Int){
        if bord[row][col] == 0 {
            if player == 1 {
                bord[row][col] = 2
                player = 2
                move+=1
            }else{
                bord[row][col] = 5
                player = 1
                move+=1
            }
        }
        
        func checkWinner() {
            var localGoOnPlay = "draw"
            var fuckDefaltInSwitchStatment = 1
            for row in 0...2 {
                var sum = 0
                for col in 0...2 {
                    sum += bord[row][col]
                }
                switch sum {
                case 6:
                    winner = "player 1"
                    return
                case 15:
                    winner = "player 2"
                    return
                case 0, 2, 4, 5, 10:
                    localGoOnPlay = "goOnPlay"
                    return
                default:
                    fuckDefaltInSwitchStatment += 1
                }
            }
            
            for col in 0...2 {
                var sum = 0
                for row in 0...2 {
                    sum += bord[row][col]
                }
                switch sum {
                case 6:
                    winner = "player 1"
                    return
                case 15:
                    winner = "player 2"
                    return
                case 0, 2, 4, 5, 10:
                    localGoOnPlay = "goOnPlay"
                    return
                default:
                    fuckDefaltInSwitchStatment += 1
                }
            }
            
            if bord[0][2] + bord[1][1] + bord[2][0] == 6 {
                winner = "player 1"
                return
            }else if bord[0][2] + bord[1][1] + bord[0][2] == 15 {
                winner = "player 2"
                return
            }else if [0,2,4,5,10].contains(bord[0][2] + bord[1][1] + bord[0][2]){
                localGoOnPlay = "goOnPlay"
            }
            
            if bord[0][0] + bord[1][1] + bord[2][2] == 6 {
                winner = "player 1"
                return
            }else if bord[0][0] + bord[1][1] + bord[2][2] == 15 {
                winner = "player 2"
                return
            }else if [0,2,4,5,10].contains(bord[0][0] + bord[1][1] + bord[2][2]){
                localGoOnPlay = "goOnPlay"
            }
            winner = localGoOnPlay
        }
        
    }
    
   
    
}
