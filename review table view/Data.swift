//
//  Data.swift
//  review table view
//
//  Created by cscoi054 on 2017. 2. 4..
//  Copyright © 2017년 a. All rights reserved.
//

import Foundation

class Data {
    class Entry {
        let filename : String
        let heading : String
        init(fname : String, heading : String) {
            self.heading = heading
            self.filename = fname
        }
    }
    
    let places = [
        Entry(fname: "구름.jpg", heading: "Heading 1"),
        Entry(fname: "디즈니.jpg", heading: "Heading 2"),
        Entry(fname: "런던.jpg", heading: "Heading 3"),
        Entry(fname: "물방울.jpg", heading: "Heading 4"),
        Entry(fname: "빛.jpg", heading: "Heading 5"),
        Entry(fname: "빛2.jpg", heading: "Heading 6"),
        Entry(fname: "이미지.jpg", heading: "Heading 7")

    ]
    
}
