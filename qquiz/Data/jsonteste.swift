//
//  jsonteste.swift
//  qquiz
//
//  Created by Donizetti de Souza on 5/18/23.
//

import SwiftUI

struct jsonteste: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack{
            
            ForEach(model.testData, id: \.id) { item in
                HStack{
                    Text("Item ID: \(item.id), Status: \(item.status)")
                    
                    Button {
                        
                        if item.status == "open"
                        {
                            item.status = "closed"
                        } else {
                            item.status = "open"
                        }
                        model.updateData2()
                        model.getLocalData2()
                    } label: {
                        Text("update")
                    }
                }
            }
            
            ForEach(model.testData) {
                
                item in
                HStack{
                    Text(item.status)
                    
                    Button {
                        
                        if item.status == "open"
                        {
                            item.status = "closed"
                        } else {
                            item.status = "open"
                        }
                        model.updateData2()
                        model.getLocalData2()
                    } label: {
                        Text("update")
                    }
                }
            }
            
        }
    }
}

struct jsonteste_Previews: PreviewProvider {
    static var previews: some View {
        jsonteste()
            .environmentObject(ContentModel())
    }
}
