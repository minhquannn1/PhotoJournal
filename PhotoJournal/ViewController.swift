import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var journalEntries: [JournalEntry] = [
        JournalEntry(title: "Trip to the Mountains", image: UIImage(named: "mountains")!, description: "A beautiful trip to the mountains."),
        JournalEntry(title: "Beach Day", image: UIImage(named: "beach")!, description: "Relaxing day at the beach."),
        JournalEntry(title: "City Exploration", image: UIImage(named: "city")!, description: "Exploring the city life.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let text = myLabel?.text {
                    print(text)
                } else {
                    print("myLabel is nil")
                }
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = journalEntries[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let destinationVC = segue.destination as? DetailViewController,
               let indexPath = sender as? IndexPath {
                destinationVC.journalEntry = journalEntries[indexPath.row]
            }
        }
    }
}
