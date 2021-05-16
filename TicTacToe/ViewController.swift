//
//  ViewController.swift
//  TicTacToe
//
//  Created by Parveen kumar on 31/10/2019 .
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainBTN: UIButton!
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.layer.masksToBounds = true
        self.mainView.layer.cornerRadius = self.mainView.frame.height * 0.10
    }

    @IBAction func buttonAction(_ sender: AnyObject) {
        let index = sender.tag!
        if (gameState[index-1] == 0){
            gameState[index-1] = activePlayer
            if activePlayer == 1{
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                activePlayer = 2
            }else{
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningCombination{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    print("CROSS")
                    self.resultLabel.text = "CROSS WIN!"
                }else{
                    print("NOUGHT")
                    self.resultLabel.text = "NOUGHT WIN!"
                }
                playAgainBTN.isHidden = false
                resultLabel.isHidden = false
            }
        }
        
        gameIsActive = false
        for i in gameState{
            if i == 0{
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false{
            resultLabel.text = "IT WAS A DRAW"
            resultLabel.isHidden = false
            playAgainBTN.isHidden = false
        }
        
    }
    
    
    @IBAction func playAgainAction(_ sender: AnyObject) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainBTN.isHidden = true
        resultLabel.isHidden = true
        for i in 1...9{
            let button = view.viewWithTag(i) as? UIButton
            button?.setImage(nil, for: UIControl.State())
        }
    }
    
}

