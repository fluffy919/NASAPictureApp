//
//  NASAViewModel.swift
//  NASAPictureApp
//
//  Created by David on 3/4/22.
//

import Foundation

class NasaViewModel: NSObject {
    
    private var apiService: APIService!
    private(set) var nasa: Nasa! {
        didSet {
            self.bindNasaViewModelToController()
        }
    }
    
    var bindNasaViewModelToController : (() -> ()) = {}
    
    var title: String {
        get {
            return nasa.title ?? ""
        }
    }
        
    var explanation: String {
        get {
            return nasa.explanation ?? ""
        }
    }
    
    var imageUrl: String {
        get {
            return nasa.imageUrl ?? ""
        }
    }
        
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetNasaData(date: nil)
    }
    
    func callFuncToGetNasaData(date: String?) {
        self.apiService.getNasaData(date: date) { (nasa) in
            self.nasa = nasa
        }
    }
}
