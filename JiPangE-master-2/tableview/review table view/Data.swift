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
        Entry(fname: "남산야외식물원.jpg", heading: "용산구 - 남산야외식물원 산책길"),
        Entry(fname: "덕수궁.jpg", heading: "중구 - 덕수궁 산책길"),
        Entry(fname: "송파소리길.jpg", heading: "송파구 - 송파소리길 - 역사탐방길"),
        Entry(fname: "정릉숲.jpeg", heading: "성북구-정릉숲 산책길")


    ]
    
}
