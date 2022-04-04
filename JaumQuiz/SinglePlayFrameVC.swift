import UIKit

class SinglePlayFrameVC: UIViewController, UITextFieldDelegate {
    var subject: String = ""
    var ans: String = ""
    var answerCount: Int = 0
    var life: Int = 3
    var rand: Int = 0
    var clearCount: Int = 0
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var ansCountLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var jaum: UILabel!
    @IBOutlet weak var bg: UILabel!
    
    var countries: [QuestionVO] = [
        QuestionVO("ㅅㅇㄷ", "스웨덴", 1, "수도는 스톡홀름"),
        QuestionVO("ㄴㅇㅈㄹㅇ", "나이지리아", 1, "국기가 초록색과 흰색으로 이루어져있어요"),
        QuestionVO("ㅍㄹㅅ", "프랑스", 1, "수도는 파리"),
        QuestionVO("ㅇㅂ", "일본", 1, "수도는 도쿄"),
        QuestionVO("ㅅㅇㅅ", "스위스", 1, "수도는 베른"),
        QuestionVO("ㅌㄹㄴㄷㄷㅌㅂㄱ", "트리니다드토바고", 4, "힌트 머하지"),
        QuestionVO("ㄷㅎㅁㄱ", "대한민국", 2, "우리나라"),
        QuestionVO("ㅍㄹㅍ", "필리핀", 1, "힌트 머하지"),
        QuestionVO("ㅋㄹㄱㅅㅅㅌ", "키르기스스탄", 2, "힌트 머하지")
    ]
    
    var animals: [QuestionVO] = [
        QuestionVO("ㅁㄷㄹㄷㅁㅂ", "목도리도마뱀", 2, "파충류에 속하며 목에 장식이 달려있어요"),
        QuestionVO("ㄷㅍㅇ", "달팽이", 1, "아주 느린 동물이에요"),
        QuestionVO("ㄴㄷ", "늑대", 1, "개랑 비슷하게 생겼어요"),
        QuestionVO("ㄱㅇㅇ", "고양이", 1, "야옹"),
        QuestionVO("ㅎㄱㅅㅇㄱㄹ", "흰긴수염고래", 3, "대왕고래라고도 불림")
    ]
    
    var capitals: [QuestionVO] = [
        QuestionVO("ㅅㅇㅌㅂㅅ", "서울특별시", 2, "우리나라의 수도"),
        QuestionVO("ㅇㅅㅌㄷㅆ", "워싱턴디씨", 2, "미국의 수도"),
        QuestionVO("ㅇㄹㅂㅌㄹ", "울란바토르", 2, "몽골의 수도"),
        QuestionVO("ㅂㄹ", "베른", 2, "스위스의 수도"),
        QuestionVO("ㅇㅅㅌㄹㄷ", "암스테르담", 2, "네덜란드의 수도"),
        QuestionVO("ㄹㄷ", "런던", 1, "영국의 수도")
    ]
    
    var soccerplayers: [QuestionVO] = [
        QuestionVO("ㅇㄹ ㅎㄹㄷ", "엘링 홀란드", 2, "도르트문트의 공격수"),
        QuestionVO("ㅈㄷ ㅍㅍㄷ", "조던 픽포드", 3, "에버튼의 골키퍼"),
        QuestionVO("ㅋㄹㅇ ㅇㅂㅍ", "킬리안 음바페", 2, "PSG의 공격수"),
        QuestionVO("ㅎㅎㅊ", "황희찬", 2, "울버햄튼의 공격수"),
        QuestionVO("ㄹㅁㄹ ㄹㅋㅋ", "로멜로 루카쿠", 2, "첼시의 공격수"),
        QuestionVO("ㅌㅁ ㅂㄹㄴ", "티모 베르너", 2, "첼시의 공격수"),
        QuestionVO("ㅌㄹㅌ ㅇㄹㅅㄷㅇㄴㄷ", "트렌트 알렉산더아놀드", 3, "리버풀의 풀백")
    ]
    
    var songs: [QuestionVO] = [
        QuestionVO("ㅍㄹㄴㅇㄷ", "파라노이드", 2, "애쉬 아일랜드의 노래"),
        QuestionVO("ㅅㅌㅋ", "스토커", 2, "10cm의 노래"),
        QuestionVO("ㅂㅇㄹㅌ", "비올레타", 2, "아이즈원의 노래"),
        QuestionVO("ㅍㄹㅌ", "팔레트", 2, "아이유의 노래"),
        QuestionVO("ㅊ ㅁㅇ ㄱㅊㄹ", "총 맞은 것처럼", 3, "백지영의 노래")
    ]
    
    var foods: [QuestionVO] = [
        QuestionVO("ㄷㄲㅅ", "돈까스", 1, "돼지고기에 빵가루를 묻혀 튀긴 음식"),
        QuestionVO("ㄸㅂㅇ", "떡볶이", 1, "한국의 대표적인 길거리 음식"),
        QuestionVO("ㅇㅇㅅㅋㄹ", "아이스크림", 1, "차가운 음식이에요"),
        QuestionVO("ㅌㅋ", "타코", 2, "멕시칸 음식"),
        QuestionVO("ㅎㄹㅇㄷㅊㅋ", "후라이드치킨", 1, "바삭바삭"),
        QuestionVO("ㄱㄱㅁㅍㅈ", "고구마피자", 1, "달콤한 피자")
    ]
    
    
    override func viewDidLoad() {
        self.userInput.becomeFirstResponder()
        bg.layer.zPosition = -1
        
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
            self.answerCount += 1
            self.clearCount += 1
            
            if subject == "country" {
                countries[rand].pass = true
                if(self.clearCount == countries.count){
                    clearAlert()
                    return;
                    //확인 버튼을 누르면 주제 선택으로 넘어가자
                }
                
                while(countries[rand].pass){
                    rand = Int.random(in: 0..<countries.count)
                }
                jaum.text = countries[rand].jaum
                ans = countries[rand].answer
            }
            else if subject == "capital" {
                capitals[rand].pass = true
                if(self.clearCount == capitals.count){
                    clearAlert()
                    return;
                }
                
                while(capitals[rand].pass){
                    rand = Int.random(in: 0..<capitals.count)
                }
                jaum.text = capitals[rand].jaum
                ans = capitals[rand].answer
            }
            else if subject == "soccerplayer" {
                soccerplayers[rand].pass = true
                if(self.clearCount == soccerplayers.count){
                    clearAlert()
                    return;
                }
                
                while(soccerplayers[rand].pass){
                    rand = Int.random(in: 0..<soccerplayers.count)
                }
                jaum.text = soccerplayers[rand].jaum
                ans = soccerplayers[rand].answer
            }
            else if subject == "song" {
                songs[rand].pass = true
                if(self.clearCount == songs.count){
                    clearAlert()
                    return;
                }
                
                while(songs[rand].pass){
                    rand = Int.random(in: 0..<songs.count)
                }
                jaum.text = songs[rand].jaum
                ans = songs[rand].answer
            }
            else if subject == "food" {
                foods[rand].pass = true
                if(self.clearCount == foods.count){
                    clearAlert()
                    return;
                }
                
                while(foods[rand].pass){
                    rand = Int.random(in: 0..<foods.count)
                }
                jaum.text = foods[rand].jaum
                ans = foods[rand].answer
            }
            else if subject == "animal" {
                animals[rand].pass = true
                if(self.clearCount == animals.count){
                    clearAlert()
                    return;
                }
                
                while(animals[rand].pass){
                    rand = Int.random(in: 0..<animals.count)
                }
                jaum.text = animals[rand].jaum
                ans = animals[rand].answer
            }
            
            let alert = UIAlertController(title: "정답입니다!", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: false, completion: nil)
        }
        else {
            self.userInput.text = ""
            
            self.life -= 1
            if(self.life == 0) {
                let alert = UIAlertController(title: "Game Over", message: "라이프를 모두 소모하였습니다.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: false, completion: nil)
                //확인 버튼을 누르면 초기 화면으로 이동해야함, .cancel은 어울리지 않는듯
            }
            else {
                let alert = UIAlertController(title: "틀렸습니다", message: "다시 생각해보세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: false, completion: nil)
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
    
    func clearAlert() {
        let alert = UIAlertController(title: "Congratulations!", message: "모든 문제를 다 푸셨습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: false, completion: nil)
    }
    
}
