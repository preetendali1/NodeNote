import UIKit


protocol DataDelegate {
    func updateArray(newArray: String)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var notesArray = [Note]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! AddNoteViewController
        
    
        if segue.identifier == "updateNoteSegue" {
            
            vc.update = true
            vc.isValidDelete = true
            vc.note = notesArray[ (notesArray.count-1) - ((tableView.indexPathForSelectedRow)?.row ?? 0)]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIFunctions.functions.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchNotes()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes()
        self.tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let arrayIndexReverse = (notesArray.count-1) - indexPath.row
            APIFunctions.functions.deleteNote(id: notesArray[arrayIndexReverse]._id)
            APIFunctions.functions.fetchNotes()
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let arrayIndexReverse = (notesArray.count-1) - indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototype", for: indexPath) as! NoteTableViewCell
        cell.timeLabel.text = notesArray[arrayIndexReverse].date
        cell.titleLabel.text = notesArray[arrayIndexReverse].title
        cell.noteLabel.text = notesArray[arrayIndexReverse].note
        
        return cell
    }
}


extension ViewController: DataDelegate {

    func updateArray(newArray: String) {
        do{
            notesArray = try JSONDecoder().decode([Note].self,from: newArray.data(using: .utf8)!)
        }catch let jsonErr {
            print(jsonErr)
        }
        self.tableView.reloadData()
    }
}
