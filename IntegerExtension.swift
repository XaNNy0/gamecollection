import UIKit

extension Int {
    
    func toBool () ->Bool? {
        switch self {
            case 0:
                return false
            case 1:
                return true
            default:
                return nil
        }
    }
}

