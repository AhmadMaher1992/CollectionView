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
    var selectedCollection: String!
    
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func addItem(_ sender: Any) {
        collectionview.performBatchUpdates({
            for _ in 0 ..< 2 {
                let text = "\(collectionData.count + 1)"
                collectionData.append(text)
                let index = IndexPath(row: collectionData.count - 1, section: 0)
                collectionview.insertItems(at: [index])
            }
        }, completion: nil)
        
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
        let width = (view.frame.size.width - 20) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCollection = collectionData[indexPath.row]
        performSegue(withIdentifier: "detailsegue", sender: indexPath)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier ==  "detailsegue" {
//           if let destination = segue.destination as? DetailsVC ,
//            let index = sender as? IndexPath {
//            destination.selectedItem = collectionData[index.row]
//            }
//
//        }
   
        if segue.identifier == "detailsegue"{
            let destination = segue.destination as! DetailsVC
            destination.selectedItem = selectedCollection
        }
        
    }
}
