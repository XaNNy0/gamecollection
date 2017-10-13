import UIKit

class Coinflip: UIViewController {
    
    var flip = -1
    var flipResult = ""
    var activePlayer: Player!
    var player1: Player!
    var player2: Player!

    @IBOutlet weak var WinrateOnUI: UILabel!
    @IBOutlet weak var correctGuesses: UILabel!
    @IBOutlet weak var totalFlipsOnUI: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var Result: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func resetStats() {
        activePlayer = player1
        setUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        resetStats()
    }
    func setUI() {
        Desc.text = "Guess the result"
        
    }
    @IBAction func game(_ sender: UIButton) {
        activePlayer.choice.currentChoice = sender.tag
        genreateRandomNumber()
        calculateUI()
        savePreviousChoice()
        updateUI()
        swapPlayers()
    }
    func genreateRandomNumber() {
        flip = Int(arc4random_uniform(2))
    }
    func didPlayerGuessedRight(Guess: Int) -> Bool {
        return flip == Guess ? true : false
    }
    func calculateUI() {
        activePlayer.calculateWinrate()
        activePlayer.increaseRoundsPlayed(game: .Coinflip)
        activePlayer.increaseRoundsWon(game: .Coinflip, result: didPlayerGuessedRight(Guess: activePlayer.choice.currentChoice))
    }
    func updateUI() {
        Desc.text = didPlayerGuessedRight(Guess: activePlayer.choice.currentChoice) ? "U Won" : "U Lose"
        WinrateOnUI.text = "\(activePlayer.winrates.Coinflip) %"
        Result.setTitle(mapFlipResult(), for: .normal)
    }
    func mapFlipResult() -> String {
        return flip.toBool()! ? "Tails" : "Head"
    }
    func swapPlayers() {
        if activePlayer === player1 {
            activePlayer = player2
        }
        else if activePlayer === player2 {
            activePlayer = player1
        }
    }
    func savePreviousChoice() {
        activePlayer.choice.previousChoices = activePlayer.choice.currentChoice
    }
}
