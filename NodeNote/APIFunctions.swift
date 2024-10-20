//
//  APIFunctions.swift
//  NodeNote
//
//  Created by Preeten Dali on 20/10/24.
//


import Foundation
import Alamofire

struct Note: Decodable {
    var title: String
    var date: String
    var _id: String
    var note: String
}

class APIFunctions {
    
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchNotes() {
        AF.request("http://localhost:8081/fetch").response { response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
                self.delegate?.updateArray(newArray: utf8Text)
                
            }
        }
        
    }
    func addNote(title: String, note: String, date: String) {
            AF.request("http://localhost:8081/form", method: .post,  encoding: URLEncoding.httpBody, headers: ["title": title, "note": note, "date": date ]).responseJSON { (response) in
            }
        }
        
        func deleteNote(id: String) {
            AF.request("http://localhost:8081/delete", method: .post,  encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON { (response) in
            }
        }
        
        func updateNote(id: String, title: String, note: String, date: String) {
            AF.request("http://localhost:8081/update", method: .post,  encoding: URLEncoding.httpBody, headers: ["id": id, "title": title, "note": note, "date": date ]).responseJSON { (response) in
            }
        }
}
