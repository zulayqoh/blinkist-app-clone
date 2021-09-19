//
//  Author.swift
//  jsonexampl
//
//  Created by Decagon on 27/07/2021.
//

import Foundation
struct Author: Codable {
    let id: Int
    let title: String
    let author: String
    let book_type: String
    let length: Int
    let image: String
    let description: String
    let access: String
}
