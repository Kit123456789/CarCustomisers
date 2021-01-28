//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Kit Ropner on 20/01/2021.
//
import SwiftUI

var counter = 0

struct ContentView: View{
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var remainingFunds = 1000
    
    
    var body: some View{
        let exhaustPackageBinding = Binding<Bool>{
            get: (self.exhausetPackage)
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -=5
                    remainingFunds += 500
                }
            }
        }
        let tiresPackageBinding = Binding<Bool>{
            get: (self.exhausetPackage)
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 1
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -=1
                    remainingFunds += 500
                }
            }
        }
        let driveTrainPackageBinding = Binding<Bool>{
            get: (self.exhausetPackage)
            set: { newValue in
                self.driveTrainPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 0.5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration -= 0.5
                    remainingFunds += 500
                }
            }
        }
        let ecuFuelPackageBinding = Binding<Bool>{
            get: (self.exhausetPackage)
            set: { newValue in
                self.ecuFuelPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 6
                    starterCars.cars[selectedCar].acceleration += 0.6
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 6
                    starterCars.cars[selectedCar].acceleration -= 0.6
                    remainingFunds += 1000
                }
            }
        }
        VStack{
            Form{
                VStack(alignment: .leading, spacing: 20){
                    Text("\(starterCars.cars[selectedCar].display())")
                    Button("Next Car", action: {
                        counter = counter % 3;
                        selectedCar = counter;
                        counter = counter + 1;
                        })
                }
                Section{
                    Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                        .disabled(true)
                    Toggle("Tires Package", isOn: tiresPackageBinding)
                    Toggle("Drivetrain Package", isOn: driveTrainPackageBinding)
                    Toggle("ECU & Fuel Package", isOn: ecuFuelPackageBinding)
                }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.blue)
                .baselineOffset(20)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
