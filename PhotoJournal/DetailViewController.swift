import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var journalEntry: JournalEntry?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = journalEntry {
            titleLabel.text = entry.title
            imageView.image = entry.image
            descriptionLabel.text = entry.description
        }
    }
}

