//
//  ViewController.swift
//  NASAPictureApp
//
//  Created by David on 3/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var image: UIImageView!
    
    private var nasaViewModel: NasaViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if #available(iOS 15.0, *) {
            // make date picker align to left in Xcode 13 with iOS 15
           datePicker.subviews.first?.semanticContentAttribute = .forceRightToLeft
        }
        
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        callToViewModelForUIUpdate()
    }


    func callToViewModelForUIUpdate(){
        self.nasaViewModel =  NasaViewModel()
        self.nasaViewModel.bindNasaViewModelToController = {
            self.updateUI()
        }
    }
    
    fileprivate func updateUI() {
        DispatchQueue.main.async {
            self.titleLabel.text = self.nasaViewModel.title
            self.descriptionLabel.text = self.nasaViewModel.explanation
            self.image.downloaded(from: self.nasaViewModel.imageUrl)
        }
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            self.nasaViewModel.callFuncToGetNasaData(date: "\(year)-\(month)-\(day)")
        }
    }
}

