//
//  ViewController.swift
//  TicTacToe
//
//  Created by @rjun lama on 10/1/17.
//  Copyright © 2017 @rjun lama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1 is noughts and 2 is cross
    var activePlayer = 1
    var gamestate = [0,0,0,0,0,0,0,0,0]
    let winningcombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var activeGame = true
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainBtn: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
        
//        print("Hello World.")
//        print((sender as AnyObject).tag)
        let activePosition = (sender as AnyObject).tag-1
        
        if(gamestate[activePosition] == 0 && activeGame)
        {
//            print((sender as AnyObject).tag)
//            print((sender as AnyObject).tag-1)
//            print(gamestate[(sender as AnyObject).tag-1])
        
            if activePlayer == 1
            {
                (sender as AnyObject).setImage(UIImage(named:"nought.png"),for:[])
                activePlayer = 2
            }else{
                (sender as AnyObject).setImage(UIImage(named:"cross.png"),for:[])
                activePlayer = 1
            }
            gamestate[activePosition] = activePlayer
            
            for combination in winningcombination{
//                print(combination[1])
//                print("helo")
//                print(gamestate[combination[0]])
                if (gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]])
                {
                
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainBtn.isHidden = false
                    if gamestate[combination[0]] == 1
                    {
                        winnerLabel.text = "Nought Has Won!!!!"
                    }else{
                        winnerLabel.text = "Cross has Won!!!!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x + 500, y: self.playAgainBtn.center.y)
                    })
                }
                
            }
        }
        
    }
    
    @IBAction func PlayAgain(_ sender: Any) {
        activePlayer = 1
        gamestate = [0,0,0,0,0,0,0,0,0]
        activeGame = true
        
        for i in 1..<10
        {
            if let button = view.viewWithTag(i) as? UIButton
            {
                button.setImage(nil, for: [])
            }
            winnerLabel.isHidden = true
            playAgainBtn.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y:playAgainBtn.center.y)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        playAgainBtn.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x - 500, y:playAgainBtn.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

