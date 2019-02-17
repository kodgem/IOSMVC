//
//  TestModel.swift
//  TestMVCBahadir
//
//  Created by Fatih durmaz on 17.02.2019.
//  Copyright © 2019 Fatih durmaz. All rights reserved.
//

import Foundation

class TestModel {
    
    var errorvalue:Int = -1
    var enbuyukdeger:Int = 65534
    var enkucukdeger:Int = 0
    var minor:Int
    var major:Int
    
    init() {
        self.minor = self.enkucukdeger;
        self.major = self.enkucukdeger;
    }
    
    init(_minor:Int,_major:Int) {
        self.minor = _minor
        self.major = _major
    }
    
    func GetDict() -> [String:AnyObject] {
        var dict = [String:AnyObject]()
        dict.updateValue(self.major as AnyObject, forKey: "major")
        dict.updateValue(self.minor as AnyObject, forKey: "minor")
        
        return dict
    }
    
    func GetDictForLogin() -> [String:AnyObject] {
        var dict = [String:AnyObject]()
        dict.updateValue(self.minor as AnyObject, forKey: "minor")
        
        return dict
    }
    
    func SetDict(value:NSDictionary){
        self.minor = value["minor"] as? Int ?? errorvalue
        self.major = value["major"] as? Int ?? errorvalue
    }
    
    func SetJson(value:[String:Any]){
        self.minor = value["minor"] as? Int ?? errorvalue
        self.major = value["major"] as? Int ?? errorvalue
    }



}
