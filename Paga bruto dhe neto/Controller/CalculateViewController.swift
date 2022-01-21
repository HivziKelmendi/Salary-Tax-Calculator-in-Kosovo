//
//  ViewController.swift
//  Paga bruto dhe neto
//
//  Created by Hivzi on 9/23/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var taxCalculator = TaxCalculator()
    
    
    @IBOutlet weak var kontributiIPunedhenesit: UILabel!
    
    @IBOutlet weak var kontributiIpunetorit: UILabel!
    
    @IBOutlet weak var pagaTextfield: UITextField!
    
    @IBOutlet weak var llojiIPagesPicker: UIPickerView!
    
    @IBOutlet weak var llojiIPunedhenesitPicker: UIPickerView!
    
    @IBOutlet weak var kontPunetStepper: UIStepper!
    
    @IBOutlet weak var kontPunedheStepper: UIStepper!
    
    @IBOutlet weak var kalkuloje: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagaTextfield.delegate = self
        
        llojiIPagesPicker.delegate = self
        llojiIPagesPicker.dataSource = self
        llojiIPunedhenesitPicker.delegate = self
        llojiIPunedhenesitPicker.dataSource = self
        
        pagaTextfield.keyboardType = .decimalPad
        pagaTextfield.returnKeyType = .done
        pagaTextfield.layer.cornerRadius = 20.0
    
        kalkuloje.layer.cornerRadius = 8.0
        kalkuloje.layer.shadowColor = UIColor.red.cgColor
        kalkuloje.layer.shadowRadius = 10.0
        
        kontPunetStepper.stepperSetUp()
        kontPunedheStepper.stepperSetUp()
        
        llojiIPagesPicker.pickerSetUP()
        llojiIPunedhenesitPicker.pickerSetUP()
        
        
        let backBarButtonItem = UIBarButtonItem(title: "Kthehu", style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = .white
        navigationItem.backBarButtonItem = backBarButtonItem
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        pagaTextfield.text = ""
    }
    
    
    var pagaNumber = 0.0
    var llojiIPageeses = ""
    var llojiIPunes = ""
    var kontrIPunetoritNumb = 5.0
    var kontrIPunedhnesitNum = 5.0
     let llojiIPages = ["Neto", "Bruto"]
     let llojiIPunedhenesit = ["Sekondar", "Primar"]
    
    @IBAction func kontributiIPunnetoritPressed(_ sender: UIStepper) {
         let kontributi = (String(format: "%.0f", sender.value))
        kontributiIpunetorit.text = "\(kontributi)%"
        kontrIPunetoritNumb = sender.value
    }
    
    @IBAction func kontributiIPunedhenesitPressed(_ sender: UIStepper) {
        let kontributi = (String(format: "%.0f", sender.value))
        kontributiIPunedhenesit.text = "\(kontributi)%"
        kontrIPunedhnesitNum = sender.value
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let doubleNumber = Double(pagaTextfield.text!) {
            pagaNumber = doubleNumber
            taxCalculator.calculateAllTaxes(pagaNumber: pagaNumber, llojiIPageeses: llojiIPageeses, llojiIPunes: llojiIPunes, kontrIPunetoritNumb: kontrIPunetoritNumb, kontrIPunedhnesitNum: kontrIPunedhnesitNum)
                   self.performSegue(withIdentifier: "result", sender: self)
        } else {
            pagaTextfield.placeholder = "shkruaje pagen"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.pagaNetoBrutoResult = taxCalculator.getPagaNetoValue()
        destinationVC.kontributiIPunetoritResult = taxCalculator.getKontributiIPunetoritValue()
        destinationVC.kontributiIPunedhenesitResult = taxCalculator.getKontributiIPunedhenesitValue()
        destinationVC.pagaQeTatohetResult = taxCalculator.getPagaQeTatohetValue()
        destinationVC.pagaMbi450Result = taxCalculator.GetPagaMbi450Value()
        destinationVC.pagaPrej250Deri450Result = taxCalculator.GetPagaPrej250Deri450Value()
        destinationVC.pagaPrej80Deri250Result = taxCalculator.GetPagaPrej80Deri250Value()
        destinationVC.pagaBrutoNetoResult = taxCalculator.getPagaBrutoValue()
        destinationVC.gjithejTatimResult = taxCalculator.GetGjithsejTatimValue()
        destinationVC.pagaBrutoLabelResult = taxCalculator.pagaFillestareLabel
        destinationVC.pagaNetoLabelResult = taxCalculator.pagaPerfundimtareLabel
        }
    }
}


//MARK: - UITextFieldDelegate


extension CalculateViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters =
            CharacterSet(charactersIn: ".0123456789").inverted
          return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }
}
  

//MARK: - UIPickerViewDelegate&DataSource

extension CalculateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return  llojiIPages.count 
       
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == llojiIPagesPicker {
         let    llojiIPageeses1 = llojiIPages[row]
            return llojiIPageeses1

        } else {
          let  llojiIPunes1 = llojiIPunedhenesit[row]
            return llojiIPunes1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == llojiIPagesPicker  {
            llojiIPageeses = llojiIPages[row]
            print(llojiIPageeses)
           }
        else if pickerView == llojiIPunedhenesitPicker {
            llojiIPunes = llojiIPunedhenesit[row]
            print(llojiIPunes)
        } else {
            llojiIPageeses = llojiIPages[0]
            llojiIPunes = llojiIPunedhenesit[0]
            
        }
    }
}

//MARK: - UIStepperExtension

extension  UIStepper {
    func stepperSetUp() {
        self.layer.cornerRadius = 12.0
        self.setDecrementImage(self.decrementImage(for: .normal), for: .normal)
        self.setIncrementImage(self.incrementImage(for: .normal), for: .normal)
   }
}

//MARK: - UIPickerViewExtension

extension UIPickerView {
    func pickerSetUP() {
        let color1 = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.setValue(color1, forKey: "textColor")
        self.layer.cornerRadius = 10.0
    }
}
