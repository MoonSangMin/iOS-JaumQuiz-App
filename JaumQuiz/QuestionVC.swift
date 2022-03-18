import UIKit

class QuestionVC: UIViewController, UITextFieldDelegate {
    var subject: String = ""
    
    struct Question {
        var jaum: String
        var answer: String
        var difficulty: Int
        var hint: String
        
        init(_ jaum: String, _ answer: String, _ difficulty: Int, _ hint: String){
            self.jaum = jaum
            self.answer = answer
            self.difficulty = difficulty
            self.hint = hint
        }
    }
    
    var countries: [Question] = [
        Question("ㅅㅇㄷ", "스웨덴", 1, "수도는 스톡홀름"),
        Question("ㄴㅇㅈㄹㅇ", "나이지리아", 1, "국기가 초록색과 흰색으로 이루어져있어요"),
        Question("ㅍㄹㅅ", "프랑스", 1, "수도는 파리"),
        Question("ㅇㅂ", "일본", 1, "수도는 도쿄")
    ]
    
    var animals: [Question] = [
        Question("ㅁㄷㄹㄷㅁㅂ", "목도리도마뱀", 2, "파충류에 속하며 목에 장식이 달려있어요"),
        Question("ㄷㅍㅇ", "달팽이", 1, "아주 느린 동물이에요"),
        Question("ㄴㄷ", "늑대", 1, "개랑 비슷하게 생겼어요")
    ]
    
    var capitals: [Question] = [
        Question("ㅅㅇㅌㅂㅅ", "서울특별시", 2, "우리나라의 수도"),
        Question("ㅇㅅㅌㄷㅆ", "워싱턴디씨", 2, "미국의 수도"),
        Question("ㅇㄹㅂㅌㄹ", "울란바토르", 2, "몽골의 수도")
    ]
    
    var soccerplayers: [Question] = [
        Question("ㅇㄹ ㅎㄹㄷ", "엘링 홀란드", 2, "도르트문트의 공격수"),
        Question("ㅈㄷ ㅍㅍㄷ", "조던 픽포드", 3, "에버튼의 골키퍼"),
        Question("ㅋㄹㅇ ㅇㅂㅍ", "킬리안 음바페", 2, "PSG의 공격수")
    ]
    
    var songs: [Question] = [
        Question("ㅍㄹㄴㅇㄷ", "파라노이드", 2, "애쉬 아일랜드의 노래"),
        Question("ㅅㅌㅋ", "스토커", 2, "10cm의 노래"),
        Question("ㅂㅇㄹㅌ", "비올레타", 2, "아이즈원의 노래")
    ]
    
    var foods: [Question] = [
        Question("ㄷㄲㅅ", "돈까스", 1, "돼지고기에 빵가루를 묻혀 튀긴 음식"),
        Question("ㄸㅂㅇ", "떡볶이", 1, "한국의 대표적인 길거리 음식"),
        Question("ㅇㅇㅅㅋㄹ", "아이스크림", 1, "차가운 음식이에요")
    ]
    
    @IBOutlet weak var jaum: UILabel!
    @IBOutlet weak var userInput: UITextField!
    var ans: String = ""
    
    func isAnswer(_ userText: String, _ answer: String){
        if userText == answer {
            print("정답입니다")
        }
        else {
            print("틀렸습니다")
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        isAnswer(userInput.text!, ans)
        
        return true
    }
    
    override func viewDidLoad() {
        self.userInput.delegate = self
        self.userInput.becomeFirstResponder()
        var rand: Int = 0
        
        if subject == "country" {
            rand = Int.random(in: 0..<countries.count)
            jaum.text = countries[rand].jaum
            ans = countries[rand].answer
        }
        else if subject == "animal" {
            rand = Int.random(in: 0..<animals.count)
            jaum.text = animals[rand].jaum
            ans = animals[rand].answer
        }
        else if subject == "capital" {
            rand = Int.random(in: 0..<capitals.count)
            jaum.text = capitals[rand].jaum
            ans = capitals[rand].answer
            
        }
        else if subject == "soccerplayer" {
            rand = Int.random(in: 0..<soccerplayers.count)
            jaum.text = soccerplayers[rand].jaum
            ans = soccerplayers[rand].answer
        }
        else if subject == "song" {
            rand = Int.random(in: 0..<songs.count)
            jaum.text = songs[rand].jaum
            ans = songs[rand].answer
        }
        else if subject == "food" {
            rand = Int.random(in: 0..<foods.count)
            jaum.text = foods[rand].jaum
            ans = foods[rand].answer
        }
        
    }
}
