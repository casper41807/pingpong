//
//  ViewController.swift
//  pingpong
//
//  Created by 陳秉軒 on 2022/3/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLable: UILabel!
    
    @IBOutlet weak var leftTotalScoreLable: UILabel!
    @IBOutlet weak var rightTotalScoreLable: UILabel!
    
    @IBOutlet weak var leftNameTextField: UITextField!
    @IBOutlet weak var rightNameTextField: UITextField!
    
    @IBOutlet weak var leftTeamLabel: UILabel!
    @IBOutlet weak var rightTeamLabel: UILabel!
    
    @IBOutlet weak var leftScoreOutlet: UIButton!
    @IBOutlet weak var rightScoreOutlet: UIButton!
    
    @IBOutlet var viewArray: [UIView]!
    
    var num:Int?
    
    var leftScore = 0
    var rightScore = 0
    
    var leftTotalScore = 0
    var rightTotalScore = 0
     
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetGame()
       
        
    }
    @IBAction func ScoreButton(_ sender: UIButton) {
        switch sender.tag{
        case 0 :
            leftScore += 1
            leftScoreLabel.text = "\(leftScore)"
            if leftScore < 11 {
                exchangeBall()
            }else{
                deuceExchangeBall()
            }
        case 1 :
            rightScore += 1
            rightScoreLable.text = "\(rightScore)"
            if rightScore < 11 {
                exchangeBall()
            }else{
                deuceExchangeBall()
            }
        default:
            break
        }
        
        switch leftScore{
        case 11 :
            if rightScore < 10{
            leftTotalScore += 1
            leftTotalScoreLable.text = "\(leftTotalScore)"
            clearScore()
            winnerExchangeBall()
            }
        default:
            if leftScore > 9,rightScore > 9{
                deuce()
            }
        }
        
        switch rightScore{
        case 11 :
            if leftScore < 10{
            rightTotalScore += 1
            rightTotalScoreLable.text = "\(rightTotalScore)"
            clearScore()
            winnerExchangeBall()
            
            }
        default:
            if leftScore > 9,rightScore > 9{
                deuce()
            }
        }
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        if let textfield = leftNameTextField.text,let textfield2 = rightNameTextField.text{
            leftTeamLabel.text = textfield
            rightTeamLabel.text = textfield2
            leftTeamLabel.isHidden = false
            rightTeamLabel.isHidden = false
            leftNameTextField.isHidden = true
            rightNameTextField.isHidden = true
            leftScoreOutlet.isEnabled = true
            rightScoreOutlet.isEnabled = true
            viewArray[0].isHidden = true
            viewArray[1].isHidden = true
            let index = Int.random(in: 0...1)
            viewArray[index].isHidden = false
            num = index
            if leftTeamLabel.text == ""{
                leftTeamLabel.text = "Player 1"
            }
            if rightTeamLabel.text == ""{
                rightTeamLabel.text = "Player 2"
            }
            
        }
    }
    

    
    @IBAction func ChangeSideButton(_ sender: UIButton) {

    }
    
    
    
    
    
    
    
    
    
    
    
    //全部清空
    @IBAction func resetButton(_ sender: UIButton) {
        clearScore()
        rightTotalScoreLable.text = "0"
        leftTotalScoreLable.text = "0"
        rightTotalScore = 0
        leftTotalScore = 0
        resetGame()
       
    }
    //清空得分
    func clearScore(){
        leftScore = 0
        rightScore = 0
        leftScoreLabel.text = "0"
        rightScoreLable.text = "0"
    }
    //deuce設定
    func deuce(){
        let sum = leftScore - rightScore
        let sum2 = rightScore - leftScore
        if sum == 2{
            leftTotalScore += 1
            leftTotalScoreLable.text = "\(leftTotalScore)"
            clearScore()
            winnerExchangeBall()
        }else if sum2 == 2{
            rightTotalScore += 1
            rightTotalScoreLable.text = "\(rightTotalScore)"
            clearScore()
            winnerExchangeBall()
        }
    }
    //輪替發球
    func exchangeBall(){
        let sum = leftScore + rightScore
        if viewArray[0].isHidden == true{
            if sum % 2 == 0 {
                viewArray[0].isHidden = false
                viewArray[1].isHidden = true
            }else{
                viewArray[0].isHidden = true
                viewArray[1].isHidden = false
            }
        }else{
            if sum % 2 == 0 {
                viewArray[0].isHidden = true
                viewArray[1].isHidden = false
            }else{
                viewArray[0].isHidden = false
                viewArray[1].isHidden = true
            }
        }
    }
    //deuce輪替發球
    func deuceExchangeBall(){
        if viewArray[0].isHidden == true{
                viewArray[0].isHidden = false
                viewArray[1].isHidden = true
        }else{
                viewArray[0].isHidden = true
                viewArray[1].isHidden = false
        }
    }
    //交換位置
    func ChangeSide(){
        
    }
    //重設遊戲
    func resetGame(){
        leftTeamLabel.isHidden = true
        rightTeamLabel.isHidden = true
        leftNameTextField.isHidden = false
        rightNameTextField.isHidden = false
        leftNameTextField.text = ""
        rightNameTextField.text = ""
        viewArray[0].isHidden = true
        viewArray[1].isHidden = true
        leftScoreOutlet.isEnabled = false
        rightScoreOutlet.isEnabled = false
    }
    
    func winnerExchangeBall(){
        if num == 1{
            viewArray[0].isHidden = false
            viewArray[1].isHidden = true
        }else if num == 0{
            viewArray[0].isHidden = true
            viewArray[1].isHidden = false
        }
    }
    
    
    
    
    
}

