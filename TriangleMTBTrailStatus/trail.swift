//
//  trail.swift
//  TriangleMTBTrailStatus
//
//  Created by Alex Onghena on 6/25/20.
//  Copyright © 2020 Alex Onghena. All rights reserved.
//

import SwiftSoup
import SwiftUI

struct Trail: Identifiable {
    var id = UUID()
    var name: String
    var status: String
    var time: String
    var num: String
}


func trail(){
    /*
     "Beaver Dam", "tel:9196761027");
     "Crabtree", "tel:9194603390");
     "Forest Ridge", "tel:9195566781");
     "Harris", "tel:9193874342");
     "Little River", "tel:9197325505");
     */
    let phoneNum:[String : String] = ["Beaver Dam" : "9196761027", "Crabtree" : "9194603390", "Forest Ridge" : "9195566781", "Harris" : "9193874342", "Little River" : "9197325505"]
    if let url = URL(string: "https://www.trianglemtb.com/mobiletrailstatus.php") {
        do {
            let contents = try String(contentsOf: url)
            let doc: Document = try SwiftSoup.parse(contents)
            let link: Element = try doc.select("table").first()!;
            let d: Elements = try link.getElementsByTag("tr");
            for tr: Element in d.array(){
                if(try tr.select("td").get(0).className() == "trail" &&  tr.id() == ""){
                    let pNum = phoneNum[try tr.select("td").get(0).text()]
                    if(pNum != nil){
                        testData.append(
                            Trail(name: try tr.select("td").get(0).text(),
                                  status: try tr.select("td").get(1).text(),
                                  time: try tr.select("td").get(2).text(),
                            num: pNum!
                        ));
                    }else{
                        testData.append(
                            
                            Trail(name: try tr.select("td").get(0).text(),
                                  status: try tr.select("td").get(1).text(),
                                  time: try tr.select("td").get(2).text(),
                            num: ""
                        ));
                    }
                }
            }
        } catch {
            // contents could not be loaded
        }
    } else {
        // the URL was bad!
    }
    print("Okay")
}

var testData = [Trail]()
