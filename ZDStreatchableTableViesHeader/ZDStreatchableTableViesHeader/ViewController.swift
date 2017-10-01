//
//  ViewController.swift
//  ZDStreatchableTableViesHeader
//
//  Created by mac on 01.10.17.
//  Copyright © 2017 Dima Zgera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        tableView.backgroundColor = UIColor.darkGray
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        imageView.image = UIImage.init(named: "Гуденя!.png")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
}

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 28
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as!
            ZDCustomTableViewCell
            
            switch indexPath.row % 2 {
            case 0:
                cell.titleLabel.text = "Hello Sergey Vladimirovich!!!___!!!"
                cell.contentView.backgroundColor = UIColor.darkGray
            default:
                cell.titleLabel.text = "Hello Oleg Donets!!!___!!!"
                cell.titleLabel.textColor = UIColor.white
                cell.contentView.backgroundColor = UIColor.black
            }
            return cell
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let y = 300 - (scrollView.contentOffset.y + 300)
            let height = min(max(y, 60), 400)
            
            
            
            imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
        
        }
    }


