//
//  ResultViewController.swift
//  Paga bruto dhe neto
//
//  Created by Hivzi on 9/24/21.
//

import UIKit

class ResultViewController: UIViewController {
   
    @IBOutlet weak var pagaBrutoLabel: UILabel!
    @IBOutlet weak var pagaNetoLabel: UILabel!
    @IBOutlet weak var pagaQeTatohetVlera: UILabel!
    @IBOutlet weak var pagaBrutoNetoVlera: UILabel!
    @IBOutlet weak var pagaNetoBrutoVlera: UILabel!
    @IBOutlet weak var kontributiIPunetoritVlera: UILabel!
    @IBOutlet weak var kontributiIPunedhenesitVlera: UILabel!
    @IBOutlet weak var pagaPrej80Deri250Vlera: UILabel!
    @IBOutlet weak var pagaPrej250Deri450Vlera: UILabel!
    @IBOutlet weak var pagaMbi450Vlera: UILabel!
    @IBOutlet weak var gjithsejTatimVlera: UILabel!
    var pagaBrutoNetoResult: String?
    var pagaQeTatohetResult: String?
    var pagaNetoBrutoResult: String?
    var kontributiIPunetoritResult: String?
    var kontributiIPunedhenesitResult: String?
    var pagaPrej80Deri250Result: String?
    var pagaPrej250Deri450Result: String?
    var pagaMbi450Result: String?
    var gjithejTatimResult: String?
    var pagaBrutoLabelResult: String?
    var pagaNetoLabelResult: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pagaBrutoNetoVlera.text =  "\(pagaBrutoNetoResult ?? "")€"
        pagaNetoBrutoVlera.text = "\(pagaNetoBrutoResult ?? "")€"
        pagaQeTatohetVlera.text =  "\(pagaQeTatohetResult ?? "")€"
        kontributiIPunetoritVlera.text = "\(kontributiIPunetoritResult ?? "")€"
        kontributiIPunedhenesitVlera.text = "\(kontributiIPunedhenesitResult ?? "")€"
        pagaPrej80Deri250Vlera.text = "\(pagaPrej80Deri250Result ?? "")€"
        pagaPrej250Deri450Vlera.text = "\(pagaPrej250Deri450Result ?? "")€"
        pagaMbi450Vlera.text = "\(pagaMbi450Result ?? "")€"
        gjithsejTatimVlera.text = "\(gjithejTatimResult ?? "")€"
        
        pagaNetoLabel.text = "\(pagaNetoLabelResult ?? "")"
        pagaBrutoLabel.text = "\(pagaBrutoLabelResult ?? "")"
       }
}
