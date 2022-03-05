import UIKit

class SinglePlayFrameVC: UIViewController {
    var subject: String = ""
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "questionContainer" {
            let qvc = segue.destination as! QuestionVC
            qvc.subject = self.subject
        }
    }
    
    override func viewDidLoad() {
        
        var answerCount: Int = 0
        var life: Int = 0
        
        if subject == "country" {
            self.subjectLabel.text = "나라"
        }
        else if subject == "capital" {
            self.subjectLabel.text = "수도"
        }
        else if subject == "soccerplayer" {
            self.subjectLabel.text = "축구선수"
        }
        else if subject == "song" {
            self.subjectLabel.text = "노래"
        }
        else if subject == "food" {
            self.subjectLabel.text = "음식"
        }
        else if subject == "animal" {
            self.subjectLabel.text = "동물"
        }
    }
}
