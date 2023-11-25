import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        if let time = eggTimes[hardness] {
            print(time)
        } else {
            print("Hardness not found")
        }
    }
    
}
