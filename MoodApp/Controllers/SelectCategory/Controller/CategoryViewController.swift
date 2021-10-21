//
//  CategoryViewController.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/15/21.
//
struct cellData {
    var name:String!
    var image:String!
    var width:Double!
    var isSelected:Bool!

}
struct cellData2 {
    var name:String!
    var iscat:Bool!
    var width:Double!
    var isSelected:Bool!

}

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var dataArray = [cellData]()
    
    
    private let spacingIphone:CGFloat = 15.0
    private let spacingIpad:CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.populateData()

        self.collectionViewSetup()
        // Do any additional setup after loading the view.
    }
    
    
    func populateData(){
        
        self.dataArray.append(cellData(name: "Vegetables", image: "Vegetables", width: 170.0,isSelected:true))
        
        self.dataArray.append(cellData(name: "Fruits", image: "Fruits", width: 130.0,isSelected:false))
        
        self.dataArray.append(cellData(name: "Fish and seafood", image: "Emoji", width: 195.0,isSelected:false))
        
        self.dataArray.append(cellData(name: "Snack", image: "Snack", width: 120.0,isSelected:true))
        
        self.dataArray.append(cellData(name: "American food", image: "American", width: 180.0,isSelected:false))
        
        self.dataArray.append(cellData(name: "Sweets", image: "Sweets", width: 125.0,isSelected:false))
        
        self.dataArray.append(cellData(name: "Mediterranean food", image: "Mediterrenian food", width: 200.0,isSelected:false))
        
        self.dataArray.append(cellData(name: "Salads", image: "Emoji-1", width: 120.0,isSelected:false))
        
        self.dataArray.append(cellData(name: "Meat products", image: "Meet", width: 175.0,isSelected:true))
        
        self.dataArray.append(cellData(name: "Eggs", image: "Emoji-2", width: 120.0,isSelected:false))
        
        
        self.dataArray.append(cellData(name: "Italian food", image: "Italian food", width: 150.0,isSelected:false))
        
        self.dataArray.append(cellData(name: "Japaneese food", image: "Japaneese", width: 180.0,isSelected:false))
        self.dataArray.append(cellData(name: "Dairy", image: "Dairy", width: 125.0,isSelected:false))
        
        
        self.dataArray.append(cellData(name: "Vietnamese food", image: "Vieetnameese", width: 190.0,isSelected:false))
        self.dataArray.append(cellData(name: "Breads", image: "Bread", width: 125.0,isSelected:false))
        
        
        

        
    }
    
    func collectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        if UIDevice.current.userInterfaceIdiom == .phone{
          layout.sectionInset = UIEdgeInsets(top: 5, left: spacingIphone, bottom: 5, right: spacingIphone)
          layout.minimumLineSpacing = 10
          layout.minimumInteritemSpacing = 5
        }
        else{
          layout.sectionInset = UIEdgeInsets(top: spacingIpad, left: spacingIpad, bottom: spacingIpad, right: spacingIpad)
          layout.minimumLineSpacing = spacingIpad
          layout.minimumInteritemSpacing = spacingIpad
        }
        self.categoryCollectionView?.collectionViewLayout = layout
      }



}
extension CategoryViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.imageIcon.image = UIImage(named: self.dataArray[indexPath.row].image!)
        cell.lblName.text = self.dataArray[indexPath.row].name!
        
        if self.dataArray[indexPath.row].isSelected{
            cell.backgroundColor = UIColor(named: "Text")
            cell.lblName.textColor  = UIColor.black
        }
        else{
            cell.backgroundColor = .clear
            cell.lblName.textColor  = UIColor(named: "Text")


        }
        
        let label = UILabel(frame: CGRect.zero)
        label.text = dataArray[indexPath.item].name!
        label.sizeToFit()
        print(label.frame.width + 100)
        cell.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y, width: CGFloat(label.frame.width + 60 ), height: 50)
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let label = UILabel(frame: CGRect.zero)
            label.text = dataArray[indexPath.item].name!
            label.sizeToFit()
            return CGSize(width: label.frame.width + 60 , height: 50)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.dataArray[indexPath.row].isSelected{
            self.dataArray[indexPath.row].isSelected = false
            collectionView.reloadData()
        }
        else{
            self.dataArray[indexPath.row].isSelected = true
            collectionView.reloadData()
        }
       
    }
    
    
}

