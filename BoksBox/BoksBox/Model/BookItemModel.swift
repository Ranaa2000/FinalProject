//
//  BookModel.swift
//  BoksBox
//
//  Created by Rana MHD on 23/02/1445 AH.
//

import Foundation
import FirebaseDatabase

// MARK: Book Item definition according to firebase database
struct BookItem: Hashable, Identifiable {
    let id = UUID()
    let ref: DatabaseReference?
    var author: String
    var country: String
    var imageName: String
    var language: String
    var link: String
    var pages: Int
    var title: String
    var year: Int
    var mobileNumber: String = ""
    var uid: String = ""

    // json key to object attribute mapping
    var dictionary: [String: Any] {
        return [
            "author": author,
            "country": country,
            "imageName": imageName,
            "language": language,
            "link": link,
            "pages": pages,
            "title": title,
            "year": year,
            "mobileNumber": mobileNumber,
            "uid": uid
        ]
    }
    
    // MARK: empty initializer
    init() {
        self.ref = nil
        self.author = ""
        self.country = ""
        self.imageName = ""
        self.language = ""
        self.link = ""
        self.pages = 0
        self.title = ""
        self.year = 1988
        self.mobileNumber = "0555555555"
        self.uid = "0"
    }
    
    // MARK: To initialize Book Item object from JSON string
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: AnyObject],
            let author = value["author"] as? String,
            let country = value["country"] as? String,
            let imageName = value["imageName"] as? String,
            let language = value["language"] as? String,
            let link = value["link"] as? String,
            let pages = value["pages"] as? Int,
            let title = value["title"] as? String,
            let year = value["year"] as? Int
            else { return nil }

        self.ref = snapshot.ref
        self.author = author
        self.country = country
        self.imageName = imageName
        self.language = language
        self.link = link
        self.pages = pages
        self.title = title
        self.year = year
        if let mobileNumber = value["mobileNumber"] as? String {
            self.mobileNumber = mobileNumber
        }
        if let uid = value["uid"] as? String {
            self.uid = uid
        }
    }

    // MARK: Convert BookItem to JSON string
    func toAnyObject() -> [String: Any] {
      return [
        "author": author,
        "country": country,
        "imageName": imageName,
        "language": language,
        "link": link,
        "pages": pages,
        "title": title,
        "year": year,
        "mobileNumber": mobileNumber,
        "uid": uid
      ]
    }
}
