//
//  ShopCellView.swift
//  ShoppingBasket
//
//  Created by Samson Lopez on 04/12/2018.
//  Copyright © 2018 Samson Lopez. All rights reserved.
//

import UIKit

class ShopCellView: UITableViewCell {

    var addButton: UIButton! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Create add button.
        addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(UIColor.blue, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
