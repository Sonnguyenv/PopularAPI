
import UIKit

class InfomationVC: UIViewController {
    var textRaw = String()
    var textHTML = String()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var descriptionRawLable: UILabel!
    @IBOutlet weak var descriptionHTMLLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionRawLable.text = textRaw.htmlToString
        descriptionHTMLLable.text = textHTML.htmlToString
    }
}
