//
//  ViewController.swift
//  BookStore
//
//  Created by Alejandro Pérez Gómez on 05/03/21.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BookStoreDelegate {
    
    // MARK: Properties
    var detailViewController : DetailViewController? = nil
    @IBOutlet weak var tableView: UITableView!
    var myBookStore = BookStore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Table View
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myBookStore.bookList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel!.text = myBookStore.bookList[indexPath.row].title
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    
    // MARK: Segues
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let selectedBook : Book = myBookStore.bookList[indexPath.row]
                    let controller = (segue.destination as! DetailViewController)
                    controller.detailItem = selectedBook
                    controller.delegate = self
                }
                
            }
            else if segue.identifier == "addBookSegue" {
                let controller = (segue.destination as! AddViewController)
                controller.delegate = self
            }
        }

    func newBook(_ controller: AnyObject, newBook: Book) {
        myBookStore.bookList.append(newBook)
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)

    }
    
    func editBook(_ controller: AnyObject, editBook: Book) {
        if let row = tableView.indexPathForSelectedRow?.row {
                myBookStore.bookList[row] = editBook
        }
                
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    func deleteBook(_ controller: AnyObject) {
        if let row = tableView.indexPathForSelectedRow?.row {
                    myBookStore.bookList.remove(at: row)
        }
                
        tableView.reloadData()
        navigationController?.popToRootViewController(animated: true)
    }
    

}

