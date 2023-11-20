
import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func keyPressed(_ sender: UIButton) {
        print(sender.currentTitle)
        playSound()
    }

    func playSound() {
        if let path = Bundle.main.path(forResource: "C.wav", ofType:nil) {
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

