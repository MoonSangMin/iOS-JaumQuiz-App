import UIKit

class QuestionVO {
    var jaum: String
    var answer: String
    var difficulty: Int
    var hint: String?
    var pass: Bool
    
    init(_ jaum: String, _ answer: String, _ difficulty: Int, _ hint: String){
        self.jaum = jaum
        self.answer = answer
        self.difficulty = difficulty
        self.hint = hint
        self.pass = false
    }
}
