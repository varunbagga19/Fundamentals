//
//  BarcodeScannervVew.swift
//  Fundamentals
//
//  Created by Varun Bagga on 28/09/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationView {
            VStack{
                ScannerView()
                    .frame(maxWidth:.infinity,maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanner BarCode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text("Not yet scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

struct BarcodeScannervVew_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
