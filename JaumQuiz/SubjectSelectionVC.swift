import UIKit

class SubjectSelectionVC: UIViewController {
    
    @IBAction func animal_btn(_ sender: Any) {
        guard let spfvc = self.storyboard?.instantiateViewController(withIdentifier: "SPFVC") as? SinglePlayFrameVC else { return }
        
        spfvc.subject = "animal"
        self.present(spfvc, animated: true)
    }
    
    @IBAction func country_btn(_ sender: Any) {
        guard let spfvc = self.storyboard?.instantiateViewController(withIdentifier: "SPFVC") as? SinglePlayFrameVC else { return }
        spfvc.subject = "country"
        self.present(spfvc, animated: true)
    }
    
    @IBAction func capital_btn(_ sender: Any) {
        guard let spfvc = self.storyboard?.instantiateViewController(withIdentifier: "SPFVC") as? SinglePlayFrameVC else { return }
        spfvc.subject = "capital"
        self.present(spfvc, animated: true)
    }
    
    @IBAction func soccerplayer_btn(_ sender: Any) {
        guard let spfvc = self.storyboard?.instantiateViewController(withIdentifier: "SPFVC") as? SinglePlayFrameVC else { return }
        spfvc.subject = "soccerplayer"
        self.present(spfvc, animated: true)
    }
    
    @IBAction func song_btn(_ sender: Any) {
        guard let spfvc = self.storyboard?.instantiateViewController(withIdentifier: "SPFVC") as? SinglePlayFrameVC else { return }
        spfvc.subject = "song"
        self.present(spfvc, animated: true)
    }
    
    @IBAction func food_btn(_ sender: Any) {
        guard let spfvc = self.storyboard?.instantiateViewController(withIdentifier: "SPFVC") as? SinglePlayFrameVC else { return }
        spfvc.subject = "food"
        self.present(spfvc, animated: true)
    }
    
}

