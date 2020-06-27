//
//  ContentView.swift
//  TriangleMTBTrailStatus
//
//  Created by Alex Onghena on 6/24/20.
//  Copyright © 2020 Alex Onghena. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    var trail: [Trail] = testData
    var body: some View {
    VStack {
        Text("Triangle MTB Trail Status").foregroundColor(.white).fontWeight(.semibold)
        List(trail) { item in
                        HStack {
                         VStack(alignment: .leading) {
                           Text(item.name)
                                 .fontWeight(.semibold)
                           Text(item.time)
                                 .font(.caption)
                         }
                        Spacer()
                     }
                     .frame(maxWidth: .infinity)
                        .padding([.bottom, .trailing], 20)
                     .cornerRadius(10)
                     .padding(10)
                        .foregroundColor(.white)
               HStack{
                  if(item.num != ""){
                    Button(action: {
                        print(item.num)
                        if let url = URL(string: "tel://\(item.num)"), UIApplication.shared.canOpenURL(url) {
                            if #available(iOS 10, *) {
                                UIApplication.shared.open(url)
                            } else {
                                UIApplication.shared.openURL(url)
                            }
                        }
                    }) {
                        Text("📞")
                    }
                  }
                if(item.status == "OPEN"){
                    Text(item.status).foregroundColor(.green)
                }else{
                    Text(item.status).foregroundColor(.red)
                }
               }
               .padding(.trailing)
                
           
           }
    .background(SwiftUI.Color.black.edgesIgnoringSafeArea(.all))
           .onAppear {
            UITableView.appearance().separatorStyle = .none
           UITableView.appearance().backgroundColor = .clear // tableview background
           UITableViewCell.appearance().backgroundColor = .clear
        }
        }.background(SwiftUI.Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(trail: testData)


    }
}

