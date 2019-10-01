//
//  ViewController.swift
//  CollectionView
//
//  Created by mac on 9/30/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionData = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let label = cell.viewWithTag(100) as? UILabel{
        label.text = collectionData[indexPath.row]
    }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.size.width - 40) / 5
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(collectionData[indexPath.row])")
    }
    
}
