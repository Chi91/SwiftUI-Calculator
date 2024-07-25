//
//  ContentView.swift
//  Calculator
//
//  Created by admin on 28.10.22.
//

import SwiftUI

struct ContentView: View {
    @State var display: String = ""
    @State var process: String = ""
    @State var operand1: String = ""
    @State var operand2: String = ""
    @State var operation: String = ""
    @State var mc : String = ""
    @State var result: Int = 0
    var body: some View {
        VStack{
            Spacer()
            Image("pumpkin")
                .resizable()
                .scaledToFit()
            Text(process)
                .font(.system(size:40))
                .frame(width:200, height:50, alignment: .center)
            
            Text(display)
                .font(.system(size:40))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .frame(width:200,height: 50, alignment: .center)
            
            
            HStack(){
                Button(action:{
                    resetValue()
                    display = ""
                    process = ""
                    
                }){
                    Text("C")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 75,height: 75)
                        .background(.gray)
                        .clipShape(Circle())
                }
                // Crash, wenn Display keine Strings enthält
                Button(action:{
                    if !display.isEmpty{
                        display.removeLast()}
                    
                }){
                    Text("Ce")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 75,height: 75)
                        .background(.gray)
                        .clipShape(Circle())
                }
                Button(action:{
                    mc = display
                    display = ""
                }){
                    Text("MC")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 75,height: 75)
                        .background(.gray)
                        .clipShape(Circle())
                }
                Button(action:{display += mc}){
                    Text("MP")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 75,height: 75)
                        .background(.gray)
                        .clipShape(Circle())
                }
            }
            
            HStack(){
                Button(action:{
                    if !operation.isEmpty{
                        display += "7"
                    }
                }){
                    Text("7")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    if !operation.isEmpty{
                        display += "8"
                    }
                    
                }){
                    Text("8")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    if !operation.isEmpty{
                        display += "9"
                    }
                }){
                    Text("9")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    resetValueDisplay()
                    operation = "+"}){
                        Text("+")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 75,height: 75)
                            .background(.orange)
                            .clipShape(Circle())
                    }
            }
            HStack(){
                Button(action:{
                    if !operation.isEmpty{
                        display += "4"
                    }
                }){
                    Text("4")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    if !operation.isEmpty{
                        display += "5"
                    }
                }){
                    Text("5")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    if !operation.isEmpty{
                        display += "6"
                    }}){
                        Text("6")
                            .bold()
                            .foregroundColor(.orange)
                            .frame(width: 75,height: 75)
                            .background(.black)
                            .clipShape(Circle())
                        
                    }
                Button(action:{
                    resetValueDisplay()
                    operation = "-"}){
                        Text("-")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 75,height: 75)
                            .background(.orange)
                            .clipShape(Circle())
                    }
            }
            HStack(){
                Button(action:{
                    if !operation.isEmpty{
                        display += "1"
                    }
                }){
                    Text("1")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    if !operation.isEmpty{
                        display += "2"
                    }
                }){
                    Text("2")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    if !operation.isEmpty{
                        display += "3"
                    }
                    
                }){
                    Text("3")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75,height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    resetValueDisplay()
                    operation = "/"}){
                        Text("/")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 75,height: 75)
                            .background(.orange)
                            .clipShape(Circle())
                    }
            }
            HStack(){
                Button(action:{
                    if !operation.isEmpty{
                        display += "0"
                    }
                }){
                    Text("0")
                        .bold()
                        .foregroundColor(.orange)
                        .frame(width: 75, height: 75)
                        .background(.black)
                        .clipShape(Circle())
                }
                Button(action:{
                    if operand1.isEmpty {
                        operand1 = display
                        process = operand1
                        display = ""
                    }
                    else{
                        if !display.isEmpty{
                            operand2 = display
                            display = ""
                            
                            switch operation {
                            case "*" : display = String(multipleCalc())
                            case "+" : display = String(addCalc())
                            case "-" : display = String(substractCalc())
                            case "/" : display = String(divisionCalc())
                            default: display = ""
                                
                            }
                        }
                   
                    }
                }){
                    Text("=")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 75,height: 75)
                        .background(.orange)
                        .clipShape(Circle())
                }
                Button(action:{ resetValueDisplay(); operation = "*"}) {
                        Text("*")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 75,height: 75)
                            .background(.orange)
                            .clipShape(Circle())
//                        .buttonStyle(OrangeBlackButton())
                    }
                
            }
            
        }
    }
    func addCalc()-> Int{
        process = operand1 + "+" + operand2
        if !operand1.isEmpty && !operand2.isEmpty{
            result = Int(operand1)! + Int(operand2)!
        }
        
        resetValue()
        return result
    }
    
    func multipleCalc()-> Int {
        process = operand1 + "*" + operand2
        if !operand1.isEmpty && !operand2.isEmpty{
            result = Int(operand1)! * Int(operand2)!
        }
        resetValue()
        return result
    }
    
    func divisionCalc() -> Int {
        process = operand1 + ":" + operand2
        if !operand1.isEmpty && !operand2.isEmpty{
            result = Int(operand1)! / Int(operand2)!
        }
        resetValue()
        return result
    }
    
    func substractCalc()-> Int {
        process = operand1 + "-" + operand2
        if !operand1.isEmpty && !operand2.isEmpty{
            result = Int(operand1)! - Int(operand2)!
        }
        resetValue()
        return result
    }
    func resetValue(){
        operand1 = ""
        operand2 = ""
        operation = ""
    }
    func resetValueDisplay(){
        process = ""
        display = ""
        resetValue()
    }
    
}

struct BlackOrangeButton: ButtonStyle{
    func makeBody(configuration: Configuration)-> some View{
        configuration.label
            .bold()
            .foregroundColor(.orange)
            .frame(width: 75, height: 75)
            .background(.black)
            .clipShape(Circle())
    }
}

struct OrangeBlackButton: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .foregroundColor(.white)
            .frame(width: 75,height: 75)
           .background(.orange)
            .clipShape(Circle())
    }
}

struct GrayButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .bold()
            .foregroundColor(.white)
            .frame(width: 75,height: 75)
            .background(.gray)
            .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



