//
//  PrototypeTableViewCell.swift
//  DynamiqueForm
//
//  Created by Developer on 17/03/2017.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class PrototypeTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    public var selectedValue = "Texte"
    var typeChamp: [String] = ["Texte", "Numero"/*, "Liste"*/]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension PrototypeTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeChamp.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeChamp[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedValue = typeChamp[row]
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
    }
}
