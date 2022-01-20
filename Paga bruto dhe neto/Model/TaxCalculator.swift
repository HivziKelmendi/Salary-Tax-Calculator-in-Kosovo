//
//  Calculator.swift
//  Paga bruto dhe neto
//
//  Created by Hivzi on 9/28/21.
//

import Foundation

struct TaxCalculator {
    
    var pagaBruto: Double = 0.0
    var kontributiIPunetoritPerTrust: Double = 0.0
    var kontributiIPunedhenesitPerTrust: Double = 0.0
    var pagaQeTatohet: Double = 0.0
    var pagaPrej0Deri80: Double = 0.0
    var pagaPrej80Deri250: Double = 0.0
    var pagaPrej250Deri450: Double = 0.0
    var pagaMbi450: Double = 0.0
    var gjithsejTatim: Double = 0.0
    var pagaNeto: Double = 0.0
    
    var pagaFillestareLabel: String = ""
    var pagaPerfundimtareLabel: String = ""
    
    mutating func calculateAllTaxes(pagaNumber: Double, llojiIPageeses: String, llojiIPunes: String, kontrIPunetoritNumb: Double, kontrIPunedhnesitNum: Double) {
        if llojiIPageeses == "Bruto" {
            pagaBruto = pagaNumber
            print(pagaBruto)
            pagaFillestareLabel = "Paga Bruto"
            pagaPerfundimtareLabel = "Paga Neto"
            kontributiIPunetoritPerTrust = pagaNumber * kontrIPunetoritNumb * 0.01
            kontributiIPunedhenesitPerTrust = pagaNumber * kontrIPunedhnesitNum * 0.01
            pagaQeTatohet = pagaNumber - kontributiIPunetoritPerTrust
            if llojiIPunes == "Primar" {
                
                if pagaQeTatohet >= 450 {
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = 6.80
                    pagaPrej250Deri450 = 16.00
                    pagaMbi450 = (pagaQeTatohet - 450)*0.1
//                    print(pagaMbi450)
                    gjithsejTatim = pagaMbi450 + 22.8
                    pagaNeto = pagaQeTatohet - gjithsejTatim
                }
                
                else if pagaQeTatohet >= 250 {
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = 6.80
                    pagaPrej250Deri450 = (pagaQeTatohet - 250)*0.08
                    pagaMbi450 = 0.00
                    gjithsejTatim = pagaPrej250Deri450 + 6.8
                    pagaNeto = pagaQeTatohet - gjithsejTatim
                }
                else if pagaQeTatohet >= 80 {
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = (pagaQeTatohet - 80)*0.04
                    pagaPrej250Deri450 = 0.00
                    pagaMbi450 = 0.00
                    gjithsejTatim = pagaPrej80Deri250 
                    pagaNeto = pagaQeTatohet - gjithsejTatim
                }
                else if pagaQeTatohet >= 0 {
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = 0.00
                    pagaPrej250Deri450 = 0.00
                    pagaMbi450 = 0.00
                    gjithsejTatim = 0.00
                    pagaNeto = pagaQeTatohet - gjithsejTatim
                }
                
            } else {
                
                pagaPrej0Deri80 = 0.00
                pagaPrej80Deri250 = 0.00
                pagaPrej250Deri450 = 0.00
                pagaMbi450 = pagaQeTatohet * 0.1
                gjithsejTatim = pagaMbi450
                pagaNeto = pagaQeTatohet - gjithsejTatim
            }
  
            
            
        } else   {
            pagaFillestareLabel = "Paga Neto"
            pagaPerfundimtareLabel = "Paga Bruto"
            if llojiIPunes == "Primar" {
                pagaBruto = pagaNumber
                
                pagaNeto = (10/9 * pagaNumber - 222/9)/(1 - kontrIPunetoritNumb*0.01)
                let pagaBrutoRound = round(pagaNeto*100)/100.0
                kontributiIPunetoritPerTrust = pagaBrutoRound * kontrIPunetoritNumb * 0.01
                kontributiIPunedhenesitPerTrust = pagaBrutoRound * kontrIPunedhnesitNum * 0.01
                pagaQeTatohet = pagaBrutoRound - kontributiIPunetoritPerTrust
                if pagaNumber >= 427.2 {
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = 6.80
                    pagaPrej250Deri450 = 16.00
                    pagaMbi450 = (pagaQeTatohet - 450)*0.1
                    gjithsejTatim = pagaMbi450 + 22.8
//                    pagaNeto = pagaQeTatohet - gjithsejTatim
                }
                
                else if pagaNumber >= 243.2 {
                    pagaBruto = pagaNumber
                    pagaNeto = ( pagaNumber/0.92 - 13.2/0.92)/(1 - kontrIPunetoritNumb*0.01)
                    let pagaBrutoRound = round(pagaNeto*100)/100.0
                    print(pagaBrutoRound)
                    kontributiIPunetoritPerTrust = pagaBrutoRound * kontrIPunetoritNumb * 0.01
                    kontributiIPunedhenesitPerTrust = pagaBrutoRound * kontrIPunedhnesitNum * 0.01
                    pagaQeTatohet = pagaBrutoRound - kontributiIPunetoritPerTrust
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = 6.80
                    pagaPrej250Deri450 = (pagaQeTatohet - 250)*0.08
                    pagaMbi450 = 0.00
                    gjithsejTatim = pagaPrej250Deri450 + 6.8
//                    pagaNeto = pagaQeTatohet - gjithsejTatim
                }
                else if pagaNumber >= 80 {
                    pagaBruto = pagaNumber
                    pagaNeto = ( pagaNumber/0.96 - 3.2/0.96)/(1 - kontrIPunetoritNumb*0.01)
                    let pagaBrutoRound = round(pagaNeto*100)/100.0
                    print(pagaBrutoRound)
                    kontributiIPunetoritPerTrust = pagaBrutoRound * kontrIPunetoritNumb * 0.01
                    kontributiIPunedhenesitPerTrust = pagaBrutoRound * kontrIPunedhnesitNum * 0.01
                    pagaQeTatohet = pagaBrutoRound - kontributiIPunetoritPerTrust
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = (pagaQeTatohet - 80)*0.04
                    pagaPrej250Deri450 = 0.00
                    pagaMbi450 = 0.00
                    gjithsejTatim = pagaPrej80Deri250
//                    pagaNeto = pagaQeTatohet - gjithsejTatim
                }
                else if pagaNumber >= 0 {
                    pagaBruto = pagaNumber
                    pagaNeto = pagaNumber/(1 - kontrIPunetoritNumb*0.01)
                    kontributiIPunetoritPerTrust = pagaBrutoRound * kontrIPunetoritNumb * 0.01
                    kontributiIPunedhenesitPerTrust = pagaBrutoRound * kontrIPunedhnesitNum * 0.01
                    pagaPrej0Deri80 = 0
                    pagaPrej80Deri250 = 0.00
                    pagaPrej250Deri450 = 0.00
                    pagaMbi450 = 0.00
                    gjithsejTatim = 0.00
                }
                
            } else {
                pagaBruto = pagaNumber
                pagaNeto = pagaNumber/(0.9*(1 - kontrIPunetoritNumb*0.01))
                print(pagaBruto)
                kontributiIPunetoritPerTrust = pagaNeto * kontrIPunetoritNumb * 0.01
                kontributiIPunedhenesitPerTrust = pagaNeto * kontrIPunedhnesitNum * 0.01
                pagaQeTatohet = pagaNeto - kontributiIPunetoritPerTrust
                pagaPrej0Deri80 = 0.00
                pagaPrej80Deri250 = 0.00
                pagaPrej250Deri450 = 0.00
                pagaMbi450 = pagaQeTatohet * 0.1
                gjithsejTatim = pagaMbi450
               
            }
        }
   
    }
    
    func getPagaNetoValue() -> String {
        
        let pagaNetoString = String(format: "%.2f", pagaNeto)
        return pagaNetoString
    }
    
    func getPagaBrutoValue() -> String {
        let pagaBrutoString = String(format: "%.2f", pagaBruto)
        return pagaBrutoString }
    
    func getKontributiIPunetoritValue() -> String {
        let kontributiIPunetoritString = String(format: "%.2f", kontributiIPunetoritPerTrust)
        return kontributiIPunetoritString }
    
    func getKontributiIPunedhenesitValue() -> String {
        let kontributiIPunedhensitString = String(format: "%.2f", kontributiIPunedhenesitPerTrust)
        return kontributiIPunedhensitString }
    
    func getPagaQeTatohetValue() -> String {
        let pagaQeTatohetString = String(format: "%.2f", pagaQeTatohet)
        return pagaQeTatohetString }
    
    func GetPagaPrej0Deri80Value() -> String {
        let pagaPrej0Deri80String = String(format: "%.2f", pagaPrej0Deri80)
        return pagaPrej0Deri80String }
    
    func GetPagaPrej80Deri250Value() -> String {
        let pagaPrej80Deri250String = String(format: "%.2f", pagaPrej80Deri250)
        return pagaPrej80Deri250String }
    
    func GetPagaPrej250Deri450Value() -> String {
        let pagaPrej250Deri450String = String(format: "%.2f", pagaPrej250Deri450)
//        print(pagaPrej250Deri450String)
        return pagaPrej250Deri450String }
    
   
    func GetPagaMbi450Value() -> String {
        let pagaMbi450ValueString = String(format: "%.2f", pagaMbi450)
//        print(pagaMbi450ValueString)
        return pagaMbi450ValueString
    }
    func GetGjithsejTatimValue() -> String {
        let gjithsejTatimString = String(format: "%.2f", gjithsejTatim)
        print(gjithsejTatimString)
        return gjithsejTatimString }
    
    
}





