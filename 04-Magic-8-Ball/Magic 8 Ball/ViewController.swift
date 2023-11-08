import UIKit

class ViewController: UIViewController {

    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]
    @IBOutlet weak var IBOutlet: UIImageView!
    @IBOutlet weak var askButtonPressed: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        IBOutlet.image = ballArray[0]
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        let randomIndex = Int.random(in: 0..<ballArray.count)
        IBOutlet.image = ballArray[randomIndex]
    }
}