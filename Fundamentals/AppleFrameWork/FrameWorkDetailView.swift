//
//  FrameWorkDetailView.swift
//  Fundamentals
//
//  Created by Varun Bagga on 28/09/23.
//

import SwiftUI

struct FrameWorkDetailView: View {
    
    let framework : Framework
//    @Binding var isShowingDetailView : Bool
    @State private var isShowingSafariView : Bool = false
    
    var body: some View {
        VStack{
            HStack{
//                Spacer()
//                Button {
////                    isShowingDetailView = false
//                } label: {
//                    Image(systemName: "xmark")
//                        .foregroundColor(Color(.label))
//                        .imageScale(.large)
//                        .frame(width: 20,height: 20)
//                }
              
            }
            .padding()
            
            

            Spacer()
            
            FrameWorkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
               AFButton(name: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url:URL(string: framework.urlString) ?? URL(string:"www.google.com")!)
        }
    }
}

struct FrameWorkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameWorkDetailView(framework: MockData.frameworks [0])
    }
}
