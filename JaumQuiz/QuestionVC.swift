import UIKit

class QuestionVC: UIViewController {
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
    
    var questions: [[String:Question]] = [
        ["country": Question("ㅅㅇㄷ", "스웨덴", 1, "수도는 스톡홀름")],
        ["country": Question("ㄴㅇㅈㄹㅇ", "나이지리아", 1, "국기가 초록색과 흰색으로 이루어져있어요")],
        ["animal": Question("ㅁㄷㄹㄷㅁㅂ", "목도리도마뱀", 2, "파충류에 속하며 목에 장식이 달려있어요")],
        ["animal": Question("ㄷㅍㅇ", "달팽이", 1, "아주 느린 동물이에요")],
        ["capital": Question("ㅅㅇㅌㅂㅅ", "서울특별시", 2, "우리나라의 수도")],
        ["capital": Question("ㅇㅅㅌㄷㅆ", "워싱턴디씨", 2, "미국의 수도")],
        ["soccerplayer": Question("ㅇㄹ ㅎㄹㄷ", "엘링 홀란드", 2, "도르트문트의 공격수")],
        ["soccerplayer": Question("ㅈㄷ ㅍㅍㄷ", "조던 픽포드", 3, "에버튼의 골키퍼")],
        ["song": Question("ㅍㄹㄴㅇㄷ", "파라노이드", 2, "애쉬 아일랜드의 노래")],
        ["song": Question("ㅅㅌㅋ", "스토커", 2, "10cm의 노래")],
        ["food": Question("ㄷㄲㅅ", "돈까스", 1, "돼지고기에 빵가루를 묻혀 튀긴 음식")],
        ["food": Question("ㄸㅂㅇ", "떡볶이", 1, "한국의 대표적인 길거리 음식")]
    ]
    
    @IBOutlet weak var jaum: UILabel!
    
    
    override func viewDidLoad() {
        
        if subject == "country" {
            let rand: Int = Int.random(in: 0...1)
            jaum.text = questions[rand]["country"]?.jaum
        }
        else if subject == "animal" {
            let rand: Int = Int.random(in: 2...3)
            jaum.text = questions[rand]["animal"]?.jaum
        }
        else if subject == "capital" {
            let rand: Int = Int.random(in: 4...5)
            jaum.text = questions[rand]["capital"]?.jaum
        }
        else if subject == "soccerplayer" {
            let rand: Int = Int.random(in: 6..<7)
            jaum.text = questions[rand]["soccerplayer"]?.jaum
        }
        else if subject == "song" {
            let rand: Int = Int.random(in: 8..<9)
            jaum.text = questions[rand]["song"]?.jaum
        }
        else if subject == "food" {
            let rand: Int = Int.random(in: 10..<11)
            jaum.text = questions[rand]["food"]?.jaum
        }
    }
}
