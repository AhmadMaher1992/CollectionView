//
//  DetailsVCViewController.swift
//  CollectionView
//
//  Created by mac on 10/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    

    var selectedItem: String?
    @IBOutlet weak var detailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLbl.text = selectedItem

    
    }
    

 

}
