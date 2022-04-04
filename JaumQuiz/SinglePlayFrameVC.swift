import UIKit

class SinglePlayFrameVC: UIViewController, UITextFieldDelegate {
    var subject: String = ""
    var ans: String = ""
    var answerCount: Int = 0
    var life: Int = 3
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var ansCountLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var jaum: UILabel!
    
    var countries: [QuestionVO] = [
        QuestionVO("ㅅㅇㄷ", "스웨덴", 1, "수도는 스톡홀름"),
        QuestionVO("ㄴㅇㅈㄹㅇ", "나이지리아", 1, "국기가 초록색과 흰색으로 이루어져있어요"),
        QuestionVO("ㅍㄹㅅ", "프랑스", 1, "수도는 파리"),
        QuestionVO("ㅇㅂ", "일본", 1, "수도는 도쿄")
    ]
    
    var animals: [QuestionVO] = [
        QuestionVO("ㅁㄷㄹㄷㅁㅂ", "목도리도마뱀", 2, "파충류에 속하며 목에 장식이 달려있어요"),
        QuestionVO("ㄷㅍㅇ", "달팽이", 1, "아주 느린 동물이에요"),
        QuestionVO("ㄴㄷ", "늑대", 1, "개랑 비슷하게 생겼어요")
    ]
    
    var capitals: [QuestionVO] = [
        QuestionVO("ㅅㅇㅌㅂㅅ", "서울특별시", 2, "우리나라의 수도"),
        QuestionVO("ㅇㅅㅌㄷㅆ", "워싱턴디씨", 2, "미국의 수도"),
        QuestionVO("ㅇㄹㅂㅌㄹ", "울란바토르", 2, "몽골의 수도")
    ]
    
    var soccerplayers: [QuestionVO] = [
        QuestionVO("ㅇㄹ ㅎㄹㄷ", "엘링 홀란드", 2, "도르트문트의 공격수"),
        QuestionVO("ㅈㄷ ㅍㅍㄷ", "조던 픽포드", 3, "에버튼의 골키퍼"),
        QuestionVO("ㅋㄹㅇ ㅇㅂㅍ", "킬리안 음바페", 2, "PSG의 공격수")
    ]
    
    var songs: [QuestionVO] = [
        QuestionVO("ㅍㄹㄴㅇㄷ", "파라노이드", 2, "애쉬 아일랜드의 노래"),
        QuestionVO("ㅅㅌㅋ", "스토커", 2, "10cm의 노래"),
        QuestionVO("ㅂㅇㄹㅌ", "비올레타", 2, "아이즈원의 노래")
    ]
    
    var foods: [QuestionVO] = [
        QuestionVO("ㄷㄲㅅ", "돈까스", 1, "돼지고기에 빵가루를 묻혀 튀긴 음식"),
        QuestionVO("ㄸㅂㅇ", "떡볶이", 1, "한국의 대표적인 길거리 음식"),
        QuestionVO("ㅇㅇㅅㅋㄹ", "아이스크림", 1, "차가운 음식이에요")
    ]
    
    override func viewDidLoad() {
        self.userInput.becomeFirstResponder()
        var rand: Int = 0
        
        self.ansCountLabel?.text = "정답 수 : \(self.answerCount)"
        self.lifeLabel?.text = ""
        for _ in 0..<self.life {
            self.lifeLabel?.text! += "★"
        }
        
        if subject == "country" {
            self.subjectLabel.text = "나라"
            rand = Int.random(in: 0..<countries.count)
            jaum.text = countries[rand].jaum
            ans = countries[rand].answer
        }
        else if subject == "capital" {
            self.subjectLabel.text = "수도"
            rand = Int.random(in: 0..<capitals.count)
            jaum.text = capitals[rand].jaum
            ans = capitals[rand].answer
        }
        else if subject == "soccerplayer" {
            self.subjectLabel.text = "축구선수"
            rand = Int.random(in: 0..<soccerplayers.count)
            jaum.text = soccerplayers[rand].jaum
            ans = soccerplayers[rand].answer
        }
        else if subject == "song" {
            self.subjectLabel.text = "노래"
            rand = Int.random(in: 0..<songs.count)
            jaum.text = songs[rand].jaum
            ans = songs[rand].answer
        }
        else if subject == "food" {
            self.subjectLabel.text = "음식"
            rand = Int.random(in: 0..<foods.count)
            jaum.text = foods[rand].jaum
            ans = foods[rand].answer
        }
        else if subject == "animal" {
            self.subjectLabel.text = "동물"
            rand = Int.random(in: 0..<animals.count)
            jaum.text = animals[rand].jaum
            ans = animals[rand].answer
        }
        
        self.userInput.delegate = self
    }
    
    func isAnswer(_ userText: String, _ answer: String){
        if userText == answer {
            self.userInput.text = ""
            print("정답입니다")
            self.answerCount += 1
        }
        else {
            self.userInput.text = ""
            print("틀렸습니다")
            self.life -= 1
            if(self.life == 0) {
                print("Game Over")
            }
        }
        
        self.ansCountLabel?.text = "정답 수 : \(self.answerCount)"
        self.lifeLabel?.text = ""
        for _ in 0..<self.life {
            self.lifeLabel?.text! += "★"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        isAnswer(userInput.text!, ans)
        
        return true
    }
    
}
