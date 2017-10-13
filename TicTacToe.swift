import UIKit

class TicTacToe: UIViewController {
    
    var player          = 1
    var roundCounter    = 0
    var position        = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameOverMessage = ""
    
    var player1: Player!
    var player2: Player!
    
    var currentPlayersName: String!
    
    @IBOutlet weak var CurrentPlayersTurnLabel: UILabel!
    
    @IBOutlet weak var Player1NameLabel: UILabel!
    @IBOutlet weak var Player1PointsLabel: UILabel!
    
    @IBOutlet weak var Player2NameLabel: UILabel!
    @IBOutlet weak var Player2PointsLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Player1NameLabel.text = "\(player1.name)"
        Player2NameLabel.text = "\(player2.name)"
        CurrentPlayersTurnLabel.text = "Current turn: \(currentPlayersName)"
        restartGame()
    }
    @IBAction func game(_ sender: UIButton) {
        if (position[sender.tag-1] == 0) {
            position[sender.tag-1] = player
            
            if (player == 1) {
                sender.setBackgroundImage(UIImage(named: "x.png"), for: .normal)
                currentPlayersName = player2.name
                player = 2
            }
            else {
                sender.setBackgroundImage(UIImage(named: "o.png"), for: .normal)
                currentPlayersName = player1.name
                player = 1
            }
        }
        sender.isEnabled = false
        roundCounter += 1
        updateUI()
        checkIfSomeoneWins()
    }
    func checkIfRedWins() -> Bool {
        return ((position[0] == 1 && position[1] == 1 && position[2] == 1) ||
                (position[3] == 1 && position[4] == 1 && position[5] == 1) ||
                (position[6] == 1 && position[7] == 1 && position[8] == 1) ||
                (position[0] == 1 && position[3] == 1 && position[6] == 1) ||
                (position[1] == 1 && position[4] == 1 && position[7] == 1) ||
                (position[2] == 1 && position[5] == 1 && position[8] == 1) ||
                (position[0] == 1 && position[4] == 1 && position[8] == 1) ||
                (position[2] == 1 && position[4] == 1 && position[6] == 1)) ? true : false
    }
    func checkIfBlueWins() -> Bool {
        return ((position[0] == 2 && position[1] == 2 && position[2] == 2) ||
                (position[3] == 2 && position[4] == 2 && position[5] == 2) ||
                (position[6] == 2 && position[7] == 2 && position[8] == 2) ||
                (position[0] == 2 && position[3] == 2 && position[6] == 2) ||
                (position[1] == 2 && position[4] == 2 && position[7] == 2) ||
                (position[2] == 2 && position[5] == 2 && position[8] == 2) ||
                (position[0] == 2 && position[4] == 2 && position[8] == 2) ||
                (position[2] == 2 && position[4] == 2 && position[6] == 2)) ? true : false
    }
    func checkIfEveryFieldIsFilled() -> Bool {
        return roundCounter == 9 ? true : false
    }
    func showGameOverAlert() {
        if(checkIfRedWins())            { gameOverMessage = "\(player1.name) Wins" }
        if(checkIfBlueWins())           { gameOverMessage = "\(player2.name) Wins" }
        if(checkIfEveryFieldIsFilled()) { gameOverMessage = "Draw" }
        
        let alert = UIAlertController(title: "Game Over", message: "\(gameOverMessage)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkIfSomeoneWins() {
        if(checkIfRedWins() || checkIfBlueWins() || checkIfEveryFieldIsFilled()) {
            checkForPoints()
            showGameOverAlert()
            restartGame()
        }
    }
    func checkForPoints()
    {
        player1.points.TicTacToe = checkIfRedWins()  ? player1.points.TicTacToe + 1 : player1.points.TicTacToe
        player2.points.TicTacToe = checkIfBlueWins() ? player2.points.TicTacToe + 1 : player2.points.TicTacToe
    }
    func restartGame() {
        initializeArray()
        initializeUI()
        updateUI()
    }
    func initializeArray() {
        player = 1
        position = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        roundCounter = 0
        gameOverMessage = ""
        currentPlayersName = player1.name
    }
    func initializeUI() {
        for i in 0...9 {
            let button = self.view.viewWithTag(i) as? UIButton
            button?.backgroundColor = UIColor.clear
            button?.layer.borderColor = UIColor.white.cgColor
            button?.layer.borderWidth = 2
            button?.setBackgroundImage(nil, for: .normal)
            button?.isEnabled = true
        }
    }
    func updateUI() {
        Player1PointsLabel.text = "Points: \(player1.points.TicTacToe)"
        Player2PointsLabel.text = "Points: \(player2.points.TicTacToe)"
        CurrentPlayersTurnLabel.text = "Current turn: \(currentPlayersName!)"
    }
}
