//
//  ContentView.swift
//  BMI
//
//  Created by 千田海生 on 2025/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var typeOfNumber = "height"
    
    let typesOfNumber  = ["meter", "centimeter"]
    var body: some View {
        NavigationStack{
            Form{
                Section("入力"){
                    HStack{
                        Text("身長")
                        Section(""){
                            // Pickerを配置
                            Picker("Type of Number", selection: $typeOfNumber) {
                                ForEach(typesOfNumber, id: \.self) { type in
                                    Text(type)
                                        .foregroundStyle(.blue) // Pickerの中の文字を青色に
                                }
                            }
                            .pickerStyle(.wheel) // ホイールタイプのPickerに設定
                        }
                    }
                    Text("体重")
                }
                
                Section("結果"){
                    Text("BMI")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
