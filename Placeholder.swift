import UIKit

class RollingDices4: UIViewController {
    
    var Player1PreviousRoll = 0
    var Player1Rolles = 0
    var Player1Points = 0
    
    var PLayer2PreviousRoll = 0
    var Player2Rolles = 0
    var Player2Points = 0
    
    var Dice1Value = 0
    var Dice1PreviousValue = 0
    
    var Dice2Value = 0
    var Dice2PreviousValue = 0
    
    var Dice1Selected = false
    var Dice2Selected = false
    
    var Player = 1
    var CurrentPlayersRollesLeft: Int = 0
    var RoundsPlayed = 0
    
    
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var RollesLeft: UILabel!
    @IBOutlet weak var RoundsPlayedUI: UILabel!
    
    @IBOutlet weak var Player1PointsUI: UILabel!
    @IBOutlet weak var Player2PointsUI: UILabel!
    
    @IBOutlet weak var Dice1: UIButton!
    @IBOutlet weak var Dice2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Player = 1
        RoundsPlayed = 0
        RerollDices()
        CurrentPlayersRollesLeft = 3
        UpdateUI()
    }
    @IBAction func EndRoundButtonPressed(_ sender: UIButton) {
        lowerCurrentPlayerRollesLeftCount(Amount: 3)
        savePreviousRolles()
        generateRandomNumber()
        nextPlayer()
    }
    @IBAction func RerollButtonPressed(_ sender: UIButton) {
        RerollDices()
    }
    func savePreviousRolles() {
        Dice1PreviousValue = Dice1Value
        Dice2PreviousValue = Dice2Value
    }
    func RerollDices() {
        savePreviousRolles()
        generateRandomNumber()
        checkifDicesAreSelected()
        lowerCurrentPlayerRollesLeftCount(Amount: 1)
        nextPlayer()
        UpdateUI()
    }
    func lowerCurrentPlayerRollesLeftCount(Amount: Int) {
        CurrentPlayersRollesLeft = CurrentPlayersRollesLeft - Amount
    }
    func checkifDicesAreSelected() {
        
        if(!Dice1Selected || CurrentPlayersRollesLeft == 0)
        {
            Dice1.setTitle("\(Dice1Value)", for: .normal)
        }
        if(!Dice2Selected || CurrentPlayersRollesLeft == 0)
        {
            Dice2.setTitle("\(Dice2Value)", for: .normal)
        }
    }
    @IBAction func dice1Pressed(_ sender: Any) {
        Dice1Selected = !Dice1Selected
        updateDicesOnUI()
    }
    @IBAction func dice2Pressed(_ sender:Any) {
        Dice2Selected = !Dice2Selected
        updateDicesOnUI()
    }
    func generateRandomNumber() {
        repeat {
            Dice1Value = Int(arc4random_uniform(7))
            Dice2Value = Int(arc4random_uniform(7))
        } while (Dice1Value == 0 || Dice2Value == 0)
    }
    func UpdateUI() {
        updateDicesOnUI()
        RollesLeft.text = "Rolles Left: \(CurrentPlayersRollesLeft)"
        Status.text = "Player: \(Player)"
        RoundsPlayedUI.text = "Rounds played: \(RoundsPlayed)"
        updatePlayerPoinsOnUI()
    }
    func updateDicesOnUI()
    {
        Dice1.layer.borderColor = UIColor.purple.cgColor
        Dice2.layer.borderColor = UIColor.purple.cgColor
        
        Dice1.layer.borderWidth = Dice1Selected  ? 1 : 0
        Dice2.layer.borderWidth = Dice2Selected  ? 1 : 0
    }
    func nextPlayer() {
        if(Player == 1 && CurrentPlayersRollesLeft < 0)
        {
            calculatePoints()
            CurrentPlayersRollesLeft = 3
            Dice1Selected = false
            Dice2Selected = false
            RoundsPlayed = RoundsPlayed + 1
            Player = 2
        }
        if(Player == 2 && CurrentPlayersRollesLeft < 0)
        {
            calculatePoints()
            CurrentPlayersRollesLeft = 3
            Dice1Selected = false
            Dice2Selected = false
            Player = 1
        }
    }
    func calculatePoints() {
        if(Player == 1) {
            Player1Points = Player1Points + Dice1PreviousValue + Dice2PreviousValue
        }
        if(Player == 2) {
            Player2Points = Player2Points + Dice1PreviousValue + Dice2PreviousValue
        }
    }
    func updatePlayerPoinsOnUI() {
        Player1PointsUI.text = "\(Player1Points)"
        Player2PointsUI.text = "\(Player2Points)"
    }
}
