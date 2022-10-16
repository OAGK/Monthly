//
//  ContentView.swift
//  Monthly
//
//  Created by Oliver Kirkegaard on 28/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.monthlyGreen
            .ignoresSafeArea()
            .overlay(
                VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    }
            .padding())

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
