//
//  ContentView.swift
//  Week04Homework
//
//  Created by Victoria Liu on 9/28/23.
//

//https://sarunw.com/posts/swiftui-list-style/
//https://sarunw.com/posts/swiftui-list-row-background-color/#:~:text=We%20can%20change%20the%20background,to%20the%20list%20row%20item.
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-style-text-views-with-fonts-colors-line-spacing-and-more

import SwiftUI

let listColor = Color(red: 205/255, green: 214/255, blue: 250/255)
let txtColor = Color(red: 43/255, green: 47/255, blue: 61/255)

struct ContentView: View {
    var body: some View {
        VStack {
//            backgroundColor
            
//questions
//- how to style the page with a background color
//- how to style/position back buttons
            NavigationView {
                List {
                    Section {
                        NavigationLink {
                            Ocean()
                        } label: {
                            Text("Ocean 🐚🌊🌅🏖️🌴")
                        }.listRowBackground(listColor).foregroundStyle(txtColor)
                        NavigationLink {
                            Park()
                        } label: {
                            Text("Park 🍃🏞️🐦🌳☀️")
                        }.listRowBackground(listColor).foregroundStyle(txtColor)
                        NavigationLink {
                            Rainforest()
                        } label: {
                            Text("Rainforest 🌴🐒🌿🦜🌧️")
                        }.listRowBackground(listColor).foregroundStyle(txtColor)
                        } header: {
                            Text("Select a Location").padding(.top).font(.headline)
                        } footer: {
                            Text("Pick a location to listen to its atmospheric sound.")
                        }
                }.navigationTitle("Atmosphere Sounds").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
