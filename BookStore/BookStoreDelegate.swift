//
//  BookStoreDelegate.swift
//  BookStore
//
//  Created by Alejandro Pérez Gómez on 16/04/21.
//

import Foundation

protocol BookStoreDelegate {
    func newBook(_ controller: AnyObject, newBook: Book)
    func editBook(_ controller: AnyObject, editBook: Book)
    func deleteBook(_ controller: AnyObject)
}
