//
//  AddNoteViewController.swift
//  NodeNote
//
//  Created by Preeten Dali on 20/10/24.
//

import UIKit
import SwiftyJSON

class AddNoteViewController: UIViewController {

    var isValidDelete = false
        var update = false
        var note: Note!

    
    
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteField: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                titleField.layer.borderWidth = 1.2
                noteField.layer.borderWidth = 1.2
                titleField.layer.cornerRadius = 3.0
                noteField.layer.cornerRadius = 3.0
                titleField.layer.borderColor = UIColor.lightGray.cgColor
                noteField.layer.borderColor = UIColor.lightGray.cgColor

    }
    
    override func viewWillAppear(_ animated: Bool) {
            if update == true {
                noteField.text = note.note
                titleField.text = note.title
                self.title = "Edit"
            }
        }

    @IBAction func deleteClicked(_ sender: Any) {
        if isValidDelete == true {
            APIFunctions.functions.deleteNote(id: note._id)
                    self.navigationController?.popViewController(animated: true)
                }

    }
    @IBAction func saveClick(_ sender: Any) {
        let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = "yyyy-MM-dd"
             let date = dateFormatter.string(from: Date())

             if noteField.text! != "" && titleField.text! != "" {
                 if update == true {
                     
                     APIFunctions.functions.updateNote(id: note._id, title: titleField.text!, note: noteField.text!, date: date)
                     
                 } else  {
                     
                     APIFunctions.functions.addNote(title: titleField.text!, note: noteField.text!, date: date)
                     
                 }
                 self.navigationController?.popViewController(animated: true)
             }
    }
    
}
