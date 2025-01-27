//
//  IMCResult.swift
//  CalculatorIMCApp
//
//  Created by Brayyan Christopher Trujillo Valle on 27/06/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack{
            Text("Tu resultado").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.white)
            let result = calculateImc(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity).background(.backgroundApp)
    }
}
func calculateImc(weight:Double, height:Double) -> Double{
    let result = weight/((height/100)*(height/100))
    
    return result
    
    
}
struct InformationView:View {
    let result:Double
    var body: some View {
        
        let information = getImcResult(result: result)
        
        VStack {
            Spacer()
            Text(information.0).foregroundColor(information.2).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            Spacer()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Spacer()
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal,8)
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16)
            .cornerRadius(16).padding(16)
    }
}

func getImcResult(result:Double)->(String,String,Color) {
    let title:String
    let description:String
    let color:Color
    
    switch result {
    case 0.00...19.99:
        title = "Peso bajo"
        description = "Estas por debajo del peso recomendado segun el IMC."
        color = .yellow
    
    case 20.00...24.99:
        title = "Peso Normal"
        description = "Estas en el peso recomendado segun el IMC."
        color = .green
        
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estas por encima del peso recomendado segun el IMC."
        color = .orange
    
    case 30.00...100:
        title = "Obesidad"
        description = "Estas muy por encima del peso recomendado segun el IMC."
        color = Color.red
    default:
        title = "ERROR"
        description = "Ha ocurrido un error"
        color = Color.red
    }
    
    return (title,description,color)
}

#Preview {
    IMCResult(userWeight: 10, userHeight: 190)
}
