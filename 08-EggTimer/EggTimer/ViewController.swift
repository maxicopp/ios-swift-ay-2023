import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        if let time = eggTimes[hardness] {
            startCountdown(time: time)
        } else {
            print("Hardness not found")
        }
    }
    
    func startCountdown(time: Int) {
        var secondsRemaining = time
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                print("\(secondsRemaining) seconds.")
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
            }
        }
    }
    
}
