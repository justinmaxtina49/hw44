//
//  ContentView.swift
//  hw44
//
//  Created by WeiMing on 2020/5/3.
//  Copyright © 2020 WeiMing. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    @State private var brightAmout = 0.0
    @State private var selectDate = Date()
    @State private var selectBlend = BlendMode.normal
    @State private var showSheet = false
    @State private var showAlert = false
    @State private var someText = ""
    let blendModes: [BlendMode] =
        [.normal, .colorBurn, .colorDodge, .screen]
    var body: some View {
        VStack{
            ZStack{
                Image(systemName: "sun.max")
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
                Image(systemName: "cloud.rain.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.green)
                .blendMode(selectBlend)
            }
            .brightness(brightAmout)
            Form{
                Toggle("顯示所有功能", isOn: $show)
                if show {
                    Sliderview(brightAmout: self.$brightAmout)
                    DatePicker(selection: $selectDate, displayedComponents: .date) {
                        Text("")
                    }
                    Picker(selection: $selectBlend, label: Text("")) {
                        Text("normal").tag(blendModes[0])
                        Text("colorBurn").tag(blendModes[1])
                        Text("colorDodge").tag(blendModes[2])
                        Text("screen").tag(blendModes[3])
                    }
                .pickerStyle(SegmentedPickerStyle())
                TextField("TextField", text: $someText)
                    Text("你輸入了\(self.someText)")
                    Button("Show Alert"){
                        self.showAlert = true
                    }
                    .alert(isPresented: self.$showAlert) {
                        return Alert(title:Text("Alert"))
                    }
                    Button("Show Sheet"){
                        self.showSheet = true
                    }
                    .sheet(isPresented: self.$showSheet) {                        secendView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Sliderview: View {
    
    @Binding var brightAmout:Double
    var body: some View {
        Slider(value: self.$brightAmout, in: 0...1, minimumValueLabel: Image(systemName: "sun.max.fill"), maximumValueLabel: Image(systemName: "sun.max")){
            Text("")
        }
    }
}
