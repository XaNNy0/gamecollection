import UIKit

class PlayerInfoHeader: UIViewController {
    
    var game: Player.Game!
    var player1: Player!
    var player2: Player!
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player1PointsLabel: UILabel!
    @IBOutlet weak var player1RoundsWonLabel: UILabel!
    @IBOutlet weak var player1WinrateLabel: UILabel!
    
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player2PointsLabel: UILabel!
    @IBOutlet weak var player2RoundsWonLabel: UILabel!
    @IBOutlet weak var player2WinrateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(game: game)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func updateUI(game: Player.Game) {
        player1NameLabel.text = player1.name
        player2NameLabel.text = player2.name
        
        switch game {
        case .Coinflip:
            player1PointsLabel.text    = "Points: \(player1.points.Coinflip)"
            player1WinrateLabel.text   = "Winrate: \(player1.winrates.Coinflip) %"
            player1RoundsWonLabel.text = "Rounds Won: \(player1.roundswon.Coinflip)"
             
            player2PointsLabel.text    = "Points: \(player2.points.Coinflip)"
            player2WinrateLabel.text   = "Winrate: \(player2.winrates.Coinflip)"
            player2RoundsWonLabel.text = "Rounds Won: \(player2.roundswon.Coinflip)"
            
        case .TicTacToe:
            player1PointsLabel.text    = "Points: \(player1.points.TicTacToe)"
            player1WinrateLabel.text   = "Winrate: \(player1.winrates.TicTacToe) %"
            player1RoundsWonLabel.text = "Rounds Won: \(player1.roundswon.TicTacToe)"
            
            player2PointsLabel.text    = "Points: \(player2.points.TicTacToe)"
            player2WinrateLabel.text   = "Winrate: \(player2.winrates.TicTacToe)"
            player2RoundsWonLabel.text = "Rounds Won: \(player2.roundswon.TicTacToe)"
            
        case .UpperLower:
            player1PointsLabel.text    = "Points: \(player1.points.UpperLower)"
            player1WinrateLabel.text   = "Winrate: \(player1.winrates.UpperLower) %"
            player1RoundsWonLabel.text = "Rounds Won: \(player1.roundswon.UpperLower)"
            
            player2PointsLabel.text    = "Points: \(player2.points.UpperLower)"
            player2WinrateLabel.text   = "Winrate: \(player2.winrates.UpperLower)"
            player2RoundsWonLabel.text = "Rounds Won: \(player2.roundswon.UpperLower)"
        
        case .RollingDices:
            player1PointsLabel.text    = "Points: \(player1.points.RollingDices)"
            player1WinrateLabel.text   = "Winrate: \(player1.winrates.RollingDices) %"
            player1RoundsWonLabel.text = "Rounds Won: \(player1.roundswon.RollingDices)"
            
            player2PointsLabel.text    = "Points: \(player2.points.RollingDices)"
            player2WinrateLabel.text   = "Winrate: \(player2.winrates.RollingDices)"
            player2RoundsWonLabel.text = "Rounds Won: \(player2.roundswon.RollingDices)"
        }
    }
}
