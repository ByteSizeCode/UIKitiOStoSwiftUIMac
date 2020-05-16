//
//  ContentView.swift
//  catalyst del 15
//
//  Created by Isaac Raval on 5/15/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import SwiftUI

//Wrap UIKit view for SwiftUI:
struct UIKitColorWheel: UIViewControllerRepresentable {
    @Binding var text: String
    func makeUIViewController(context: Context) -> MyViewController {return MyViewController()}
    func updateUIViewController(_ uiViewController: MyViewController, context: Context) {//uiView.text = text}
    typealias UIViewControllerType = MyViewController
    }
}

struct ContentView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Text("Here is a non-SwiftUI view origionally made for iOS, now running on Mac:")
            //Use it here:
            UIKitColorWheel(text: self.$text).offset(y: -200)
        }
    }
}
