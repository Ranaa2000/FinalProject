//
//  BookModel.swift
//  BoksBox
//
//  Created by Rana MHD on 23/02/1445 AH.
//

import Foundation
import FirebaseDatabase

struct BookItem: Hashable {
    let ref: DatabaseReference?
    var author: String
    var country: String
    var imageName: String
    var language: String
    var link: String
    var pages: Int
    var title: String
    var year: Int
    
    var dictionary: [String: Any] {
        return [
            "author": author,
            "country": country,
            "imageName": imageName,
            "language": language,
            "link": link,
            "pages": pages,
            "title": title,
            "year": year
        ]
    }
    
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
    }

    // MARK: Convert GroceryItem to AnyObject
    func toAnyObject() -> [String: Any] {
      return [
        "author": author,
        "country": country,
        "imageName": imageName,
        "language": language,
        "link": link,
        "pages": pages,
        "title": title,
        "year": year
      ]
    }
}
