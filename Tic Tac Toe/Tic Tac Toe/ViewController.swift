//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Siddharth Bhatt on 18/05/15.
//  Copyright (c) 2015 Siddharth Bhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //This is the active player. There are only two players : 1,2
    var player = 1
    
    var counter = 0
    var gameActive = true
    
    // 0 = empty
    // 1 = noughts
    // 2 = crosses
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombo = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var winningLabel: UILabel!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    @IBAction func userTapped(sender: UITapGestureRecognizer) {
        if !gameActive{
            //restart the game
            //println("User tapped the screen")
            player = 1
            counter = 0
            gameActive = true
            
            // 0 = empty
            // 1 = noughts
            // 2 = crosses
            gameState = [0,0,0,0,0,0,0,0,0]
            
            var button : UIButton
            for var i=0; i<9; i++ {
                button = view.viewWithTag(i) as! UIButton
                button.setImage(nil, forState: .Normal)
            }
            
            tapRecognizer.enabled = false
            winningLabel.hidden = true
            
        }
    }
    

    @IBAction func buttonPressed(sender: UIButton) {

        //we continue only if the button is being pressed the first time.
        if gameState[sender.tag] == 0 && gameActive == true {
            
            counter++
            gameState[sender.tag] = player
            var image = UIImage()
        
            if player == 1 {
                image = UIImage(named: "nought.png")!
                player = 2
            }else{
                image = UIImage(named: "cross.png")!
                player = 1
            }
        
            sender.setImage(image, forState: .Normal)
            //println(sender.tag)
            
            //check for winner
            for combo in winningCombo {
                
                if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] && gameActive == true{
                    
                    //println("We have a winner")
                    
                    gameActive = false
                    if gameState[combo[0]] == 1 {
                        //player 1 won
                        declareWinner(1)
                    }else{
                        //player 2 won
                        declareWinner(2)
                    }
                }
                
            }
            
            if counter>=9 && gameActive == true {
                //nobody won
                counter=0
                gameActive = false
                declareWinner(0)
                //update label here
            }
            
        }
        
    }
    
    func declareWinner(winner: Int){
        
        tapRecognizer.enabled = true
        winningLabel.hidden = false
        
        if winner == 0 {
            winningLabel.text = "Its a tie !"
        }else{
            winningLabel.text = "Player \(winner) won !"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winningLabel.hidden = true
        tapRecognizer.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

