//
//  ContentView.swift
//  BMI
//
//  Created by 千田海生 on 2025/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var typeOfNumber = "height"
    @State private var height: Float? = nil
    @State private var weight: Float? = nil
    
    let typesOfNumber  = ["meter", "centimeter"]
    var body: some View {
        NavigationStack{
            Form{
                Section("入力"){
                    HStack{
                        TextField("身長", value: $height, format: .number)
                            .keyboardType(.decimalPad)
                        Section(""){
                            // Pickerを配置
                            Picker("", selection: $typeOfNumber) {
                                ForEach(typesOfNumber, id: \.self) { type in
                                    Text(type)
                                        .foregroundStyle(.blue) // Pickerの中の文字を青色に
                                }
                            }
                        }
                    }
                    
                    HStack{
                        TextField("体重", value: $weight, format: .number)
                            .keyboardType(.decimalPad)
                        Text("kg")
                    
                    }
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
