//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Kit Ropner on 20/01/2021.
//

import SwiftUI
var counter = 0

struct ContentView: View {
    let starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("\(starterCars.cars[selectedCar].display())")
            Button("Next Car", action: {
                counter = counter % 3;
                selectedCar = counter;
                counter = counter + 1;
            })
            Toggle("Exhaust Package", isOn: $exhaustPackage)
            Toggle("Tires Package", isOne: $tiresPackage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
