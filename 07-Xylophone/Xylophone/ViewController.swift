
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        
        if let note = sender.currentTitle {
            playSound(soundName: note)
        }
    }
    
    func playSound(soundName: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType:"wav") {
            let url = URL(fileURLWithPath: path)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                // couldn't load file :(
            }
        }
    }
}

