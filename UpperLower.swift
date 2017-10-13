import UIKit

class UpperLower: UIViewController
{
    var randomNumber = 0
    var playerChoise = -1
    var game: Player.Game!
    var player1: Player!
    var player2: Player!
    
    @IBOutlet weak var Result: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateRandomNumber()
        Result.setTitle("\(randomNumber)", for: .normal)
    }
    @IBAction func game(_ sender: UIButton) {
        playerChoise = sender.tag
        generateRandomNumber()
        showResult()
    }
    func generateRandomNumber() {
        randomNumber = Int(arc4random_uniform(100))
    }
    func showResult() {
        Result.setTitle("\(randomNumber)", for: .normal)
    }
    func didPlayerGuessedRight() -> Bool {
        return (playerChoise == 1 && randomNumber < 50 || playerChoise == 2 && randomNumber == 50 || playerChoise == 3 && randomNumber > 50) ? true : false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {

        let PlayerInfoHeaderView = segue.destination as? PlayerInfoHeader
        
        PlayerInfoHeaderView?.player1 = player1
        PlayerInfoHeaderView?.player2 = player2
        PlayerInfoHeaderView?.game    = game
    }

}
