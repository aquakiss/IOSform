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
    
    var typeChamp: [String] = ["Texte", "Numero", "Liste"]
    
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
    
    public func getValue() -> String {
        return self.fieldText.text!;
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
    
}
