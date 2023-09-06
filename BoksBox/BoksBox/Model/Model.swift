//
//  Model.swift
//  BoksBox
//
//  Created by الوليد خشيم on 21/02/1445 AH.
//

import Foundation

struct Bookmodel:Hashable {
    var titel:String = ""
    var image:String = ""
    
}

var book:Bookmodel = Bookmodel(titel: "tg4g",image: "a1")
var arr:Array = [book]


