//
//  ContentView.swift
//  BMI
//
//  Created by 千田海生 on 2025/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var typeOfNumber = "meter"
    let typesOfNumber  = ["meter", "centimeter"]
    
    @State private var height: String = ""
    @State private var weight: String = ""
    
    // 計算プロパティで型変換
    var heightNumber: Float? {
        guard let value = Float(height) else { return nil }
            if typeOfNumber == "centimeter" {
                return value / 100.0
            } else {
                return value // meter の想定
            }
        }
    var weightNumber: Float? {
        Float(weight)
    }
    
    var bmi: Float? {
        guard let h = heightNumber, let w = weightNumber, h > 0 else { return nil }
               return w / (h * h)
           }
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section("入力"){
                    HStack{
                        TextField("身長", text: $height)
                        Section(""){
                            // Pickerを配置
                            Picker("", selection: $typeOfNumber) {
                                ForEach(typesOfNumber, id: \.self) { type in
                                    Text(type)
                                }
                            }
                        }
                    }
                    
                    HStack{
                        TextField("体重", text: $weight)
                        Text("kg")
                        
                    }
                }
                
                Section("結果") {
                    if let bmi = bmi {
                        Text("BMI: \(String(format: "%.2f", Double(bmi)))")
                    } else {
                        Text("正しい数値を入力してください")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
