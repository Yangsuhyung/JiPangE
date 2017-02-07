//
//  data2.swift
//  review table view
//
//  Created by cscoi054 on 2017. 2. 7..
//  Copyright © 2017년 a. All rights reserved.
//

import Foundation

class Data2 {
    class Entry2 {
        let filename : String
        let heading : String
        init(fname : String, heading : String) {
            self.heading = heading
            self.filename = fname
        }
    }
    
    let places = [
        Entry2(fname: "남산야외식물원.jpg", heading: "용산구 - 남산야외식물원 산책길"),
        Entry2(fname: "덕수궁.jpg", heading: "중구 - 덕수궁 산책길"),
        Entry2(fname: "송파소리길.jpg", heading: "송파구 - 송파소리길 - 역사탐방길"),
        Entry2(fname: "정릉숲.jpeg", heading: "성북구-정릉숲 산책길")
        
        
    ]
    
}
