//
//  AddViewController.swift
//  BookStore
//
//  Created by Alejandro Pérez Gómez on 16/04/21.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate,  UITextViewDelegate {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var pagesText: UITextField!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var descriptionText: UITextView!
    
    var book = Book()
    var delegate: BookStoreDelegate?
    var editBook = false
    
    
    @IBAction func saveBook(_ sender: UIButton) {
        book.title = titleText.text!
        book.author = authorText.text!
        book.description = descriptionText.text!
                
        if let text = pagesText.text, let pages = Int(text) {
            book.pages = pages
        }
                
        if switchOutlet.isOn {
            book.readThisBook = true
        } else {
            book.readThisBook = false
        }
                
        if editBook {
            delegate?.editBook(self, editBook: book)
        } else {
            delegate?.newBook(self, newBook: book)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.delegate = self
        authorText.delegate = self
        pagesText.delegate = self
        descriptionText.delegate = self
        if editBook {
            print("mostrando cosas")
            self.title = "Edit Book"
            titleText.text = book.title
            authorText.text = book.author
            pagesText.text = String(book.pages)
            descriptionText.text = book.description
                    
            if book.readThisBook {
                switchOutlet.isOn = true
            } else {
                switchOutlet.isOn = false
            }
                    
        }
        else{
            self.title = "Add Book"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        else{
            return true
        }
        
    }
}
