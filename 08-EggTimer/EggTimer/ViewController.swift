import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var audioPlayer: AVAudioPlayer!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        if let time = eggTimes[hardness] {
            startCountdown(time: Double(time))
            progressBar.progress = 0.0
        } else {
            print("Hardness not found")
        }
    }
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    func startCountdown(time: Double) {
        var secondsRemaining = time
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            if secondsRemaining > 0 {
                print("\(secondsRemaining) seconds.")
                secondsRemaining -= 1
                
                // Update progress bar
                let percentageComplete = 1 - (secondsRemaining / time)
                self?.progressBar.progress = Float(percentageComplete)
                
            } else {
                timer.invalidate()
                self?.titleLabel.text = "DONE!"
                
                // Alarm sound
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self?.audioPlayer = try? AVAudioPlayer(contentsOf: url!)
                self?.audioPlayer.play()
            }
        }
    }
    
}
