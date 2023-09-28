//
//  FrameworkGridView.swift
//  Fundamentals
//
//  Created by Varun Bagga on 28/09/23.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks, id: \.id) { data in
                        NavigationLink(value: data){
                            FrameWorkTitleView(framework:data)
                        }
//                            .onTapGesture {
//                                viewModel.selectedFramework  = data
//                        }
                    }
                }
            }
            .padding()
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                FrameWorkDetailView(framework: framework)
                        
            }
//            .sheet(isPresented: $viewModel.isShowingDetailView) {
//                FrameWorkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
//            }
        }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

struct FrameWorkTitleView: View{
    let framework : Framework
    
    var body : some View {
        VStack{
            Image(framework.imageName)
                .resizable()
                .frame(width: 90,height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(.label))
                .scaledToFit()
                .minimumScaleFactor(0.5)
            
        }
    }
}
