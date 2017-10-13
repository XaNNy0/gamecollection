import UIKit

class RollingDices: UIViewController {
    
    var Dice1Value = 0
    var Dice1PreviousValue = 0
    var Dice1PossibleUpcommingValue: Int = 0
    
    var Dice2Value = 0
    var Dice2PreviousValue = 0
    var Dice2PossibleUpcommingValue: Int = 0
    
    var Dice1Selected = false
    var Dice2Selected = false
    
    var player1: Player!
    var player2: Player!
    var activePlayer: Player!
    
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var RollesLeft: UILabel!
    @IBOutlet weak var RoundsPlayedUI: UILabel!
    
    @IBOutlet weak var Player1NameUI: UILabel!
    @IBOutlet weak var Player2NameUI: UILabel!
    
    @IBOutlet weak var Player1PointsUI: UILabel!
    @IBOutlet weak var Player2PointsUI: UILabel!
    
    @IBOutlet weak var Dice1: UIButton!
    @IBOutlet weak var Dice2: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activePlayer = player1
        activePlayer.turns = 3
        savePreviousRolles()
        generateRandomNumber()
        assignNewValuesToDices()
        updateUI()
    }
    @IBAction func rerollButtonPressed() {
        savePreviousRolles()
        generateRandomNumber()
        assignNewValuesToDices()
        lowerCurrentPlayerRollesLeftCount(Amount: 1)
        nextPlayer()
        updateUI()
    }
    @IBAction func endRoundButtonPressed() {
        savePreviousRolles()
        activePlayer.turns = -1
        nextPlayer()
        updateUI()
    }
    func nextPlayer() {
        if(activePlayer === player1 && activePlayer.turns < 0)
        {
            calculatePoints()
            activePlayer.turns = 3
            Dice1Selected = false
            Dice2Selected = false
            activePlayer.increaseRoundsPlayed(game: .RollingDices)
            activePlayer = player2
        }
        if(activePlayer === player2 && activePlayer.turns < 0)
        {
            calculatePoints()
            activePlayer.turns = 3
            Dice1Selected = false
            Dice2Selected = false
            activePlayer = player1
        }
        generateRandomNumber()
        assignNewValuesToDices()
        updateUI()
    }
    @IBAction func dice1Pressed(_ sender: UIButton) {
        Dice1Selected = !Dice1Selected
        updateDicesOnUI()
    }
    @IBAction func dice2Pressed(_ sender: UIButton) {
        Dice2Selected = !Dice2Selected
        updateDicesOnUI()
    }
    func updateDicesOnUI()
    {
        Dice1.layer.borderColor = UIColor.white.cgColor
        Dice2.layer.borderColor = UIColor.white.cgColor
        
        Dice1.layer.borderWidth = Dice1Selected  ? 2 : 0
        Dice2.layer.borderWidth = Dice2Selected  ? 2 : 0
        
        Dice1.setTitle("\(Dice1Value)", for: .normal)
        Dice2.setTitle("\(Dice2Value)", for: .normal)
    }
    func savePreviousRolles() {
        Dice1PreviousValue = Dice1Value
        Dice2PreviousValue = Dice2Value
    }
    func generateRandomNumber() {
        repeat {
            Dice1PossibleUpcommingValue = Int(arc4random_uniform(7))
            Dice2PossibleUpcommingValue = Int(arc4random_uniform(7))
        } while (Dice1PossibleUpcommingValue == 0 || Dice2PossibleUpcommingValue == 0)
    }
    func assignNewValuesToDices() {
        Dice1Value = Dice1Selected ? Dice1PreviousValue : Dice1PossibleUpcommingValue
        Dice2Value = Dice2Selected ? Dice2PreviousValue : Dice2PossibleUpcommingValue
        updateDicesOnUI()
    }
    func lowerCurrentPlayerRollesLeftCount(Amount: Int) {
        activePlayer.turns = activePlayer.turns - Amount
    }
    func calculatePoints() {
            activePlayer.points.RollingDices = activePlayer.points.RollingDices + Dice1PreviousValue + Dice2PreviousValue
    }
    func updateUI() {
        updateDicesOnUI()
        updateStatusBar()
        updatePlayerPoinsOnUI()
    }
    func updatePlayerPoinsOnUI() {
        Player1PointsUI.text = "Points: \(player1.points.RollingDices)"
        Player2PointsUI.text = "Points: \(player2.points.RollingDices)"
    }
    func updateStatusBar() {
        RollesLeft.text = "Rolles Left: \(activePlayer.turns)"
        Status.text = "Player: \(activePlayer.name)"
        RoundsPlayedUI.text = "Rounds played: \(activePlayer.roundsplayed.RollingDices)"
        Player1NameUI.text = "\(player1.name)"
        Player2NameUI.text = "\(player2.name)"
        
    }
}
