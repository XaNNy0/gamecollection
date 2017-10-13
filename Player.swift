import UIKit

class Player {
    
    var name = "PlayerName"
    var turns: Int!
    var points = Point()
    var winrates = Winrate()
    var roundsplayed = RoundsPlayed()
    var roundswon = RoundsWon()
    var choice = Choice()
    
    enum Game {
        case Coinflip
        case TicTacToe
        case UpperLower
        case RollingDices
    }
    struct Point {
        var Coinflip = 0
        var TicTacToe = 0
        var UpperLower = 0
        var RollingDices = 0
    }
    struct Winrate {
        var Coinflip = 0.0
        var TicTacToe = 0.0
        var UpperLower = 0.0
        var RollingDices = 0.0
    }
    struct RoundsPlayed {
        var Coinflip = 0
        var TicTacToe = 0
        var UpperLower = 0
        var RollingDices = 0
    }
    struct RoundsWon {
        var Coinflip = 0
        var TicTacToe = 0
        var UpperLower = 0
        var RollingDices = 0
    }
    struct Choice {
        var previousChoices = 0
        var currentChoice = 0
    }
    func calculateWinrate() {
        winrates.Coinflip = ((Double(roundswon.Coinflip)/Double(roundsplayed.Coinflip))*100).rounded(toPlaces: 2)
        winrates.TicTacToe = ((Double(roundswon.TicTacToe)/Double(roundsplayed.TicTacToe))*100).rounded(toPlaces: 2)
        winrates.UpperLower = ((Double(roundswon.UpperLower)/Double(roundsplayed.UpperLower))*100).rounded(toPlaces: 2)
        winrates.RollingDices = ((Double(roundswon.RollingDices)/Double(roundsplayed.RollingDices))*100).rounded(toPlaces: 2)
    }
    func increaseRoundsPlayed(game: Game) {
        switch game {
        case .Coinflip:
            roundsplayed.Coinflip = roundsplayed.Coinflip + 1
        case .TicTacToe:
            roundsplayed.TicTacToe = roundsplayed.TicTacToe + 1
        case .UpperLower:
            roundsplayed.UpperLower = roundsplayed.UpperLower + 1
        case .RollingDices:
            roundsplayed.RollingDices = roundsplayed.RollingDices + 1
        }
    }
    func increaseRoundsWon(game: Game, result: Bool) {
        if result {
            switch game {
                case .Coinflip:
                    roundswon.Coinflip = roundswon.Coinflip + 1
                case .TicTacToe:
                    roundswon.TicTacToe = roundswon.TicTacToe + 1
                case .UpperLower:
                    roundswon.UpperLower = roundswon.UpperLower + 1
                case .RollingDices:
                    roundswon.RollingDices = roundswon.RollingDices + 1
            }
        }
    }
}
