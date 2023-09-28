//
//  AFButton.swift
//  Fundamentals
//
//  Created by Varun Bagga on 28/09/23.
//

import SwiftUI

struct AFButton: View {
    let name : String
    var body: some View {
        Text(name)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280,height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(name:"buttn")
    }
}
