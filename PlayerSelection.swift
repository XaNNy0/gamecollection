	import UIKit

class playerSelection: UIViewController {
    
    @IBOutlet weak var player1NameInputField: UITextField!
    @IBOutlet weak var player2NameInputField: UITextField!
    @IBOutlet weak var CPUSwitch: UISwitch!
    
    var player1: Player!
    var player2: Player!
    
    var player1DefaultText = "Enter Players 1 name"
    var player2DefaultText = "Enter Players 2 name"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        
        player1NameInputField.text = player1DefaultText
        player2NameInputField.text = player2DefaultText
        
        self.player1 = Player()
        self.player2 = Player()
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if(navigationController!.viewControllers.count > 1){
            return true
        }
        return false
    }
    @IBAction func switchPressed(_ sender: UISwitch) {
        player2NameInputField.isUserInteractionEnabled = !player2NameInputField.isUserInteractionEnabled
        player2NameInputField.isEnabled                = !player2NameInputField.isEnabled
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        loseFocusOnInputFields()
        return validatePlayerNameEntries(Player1Name: player1NameInputField.text!, Player2Name: player2NameInputField.text!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameSelectionView = segue.destination as? gameSelection
        
        player1.name = player1NameInputField.text!
        player2.name = player2NameInputField.text!
        
        gameSelectionView?.player1 = player1
        gameSelectionView?.player2 = player2
    }
    func loseFocusOnInputFields() {
        player1NameInputField.resignFirstResponder()
        player2NameInputField.resignFirstResponder()
    }
    func validatePlayerNameEntries(Player1Name: String, Player2Name: String) -> Bool {
        
        if(Player1Name != "" && Player1Name != player1DefaultText)
        {
            if((Player2Name != "" && Player2Name != player2DefaultText) || CPUSwitch.isOn) { return true }
        }
        let alert = UIAlertController(title: "Alert", message: "Please complete your entries", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return false
    }
}

