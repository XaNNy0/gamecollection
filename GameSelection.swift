import UIKit

class gameSelection: UIViewController {
    
    var game: Player.Game!
    
    var player1: Player!
    var player2: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        switch ((sender as AnyObject).tag) {
        case 1:
            game = Player.Game.TicTacToe
        case 2:
            game = Player.Game.Coinflip
        case 3:
            game = Player.Game.UpperLower
        case 4:
            game = Player.Game.RollingDices
        default:
            game = Player.Game.TicTacToe
        }
        
        let CoinflipView         = segue.destination as? Coinflip
        let TicTacToeView        = segue.destination as? TicTacToe
        let UpperLowerView       = segue.destination as? UpperLower
        let RollingDicesView     = segue.destination as? RollingDices
        let PlayerInfoHeaderView = segue.destination as? PlayerInfoHeader
        
        TicTacToeView?.player1 = player1
        TicTacToeView?.player2 = player2
        
        CoinflipView?.player1  = player1
        CoinflipView?.player2  = player2
        
        UpperLowerView?.game    = game
        UpperLowerView?.player1 = player1
        UpperLowerView?.player2 = player2
        
        RollingDicesView?.player1 = player1
        RollingDicesView?.player2 = player2
        
        PlayerInfoHeaderView?.player1 = player1
        PlayerInfoHeaderView?.player2 = player2
        PlayerInfoHeaderView?.game    = game
    }
}
