import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateAnswerOptions()
        progressBar.progress = 0
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        sender.backgroundColor = userGotItRight ? UIColor.green : UIColor.red
        
        sender.isUserInteractionEnabled = false
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            self.quizBrain.nextQuestion()
            self.updateUI()
            self.updateAnswerOptions()
            sender.isUserInteractionEnabled = true
        }
    }
    
    func updateUI() {
        button1.backgroundColor = .clear
        button2.backgroundColor = .clear
        button3.backgroundColor = .clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].text
        progressBar.progress = Float(quizBrain.questionNumber + 1) / Float(quizBrain.quiz.count)
    }
    
    func updateAnswerOptions() {
        let answerOptions = quizBrain.getAnswerOptions()

        button1.setTitle(answerOptions[0], for: .normal)
        button2.setTitle(answerOptions[1], for: .normal)
        button3.setTitle(answerOptions[2], for: .normal)
    }
    
    
}

