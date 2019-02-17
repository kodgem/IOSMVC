//
//  ViewController.swift
//  TestMVCBahadir
//
//  Created by Fatih durmaz on 17.02.2019.
//  Copyright © 2019 Fatih durmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBtnLogin: UIView!
    @IBOutlet weak var viewBtnSginUp: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSginUp: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }

    func setupUI() {
        // label Title
        labelTitle.textColor = UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1)
        labelTitle.font = UIFont(name: "Helvetica-Light", size: 24)
        labelTitle.text = "STRAIGHT"
        
        // btn Login
        viewBtnLogin.layer.cornerRadius = 19
        viewBtnLogin.layer.borderWidth = 1
        viewBtnLogin.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1).cgColor
        viewBtnLogin.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        btnLogin.setTitleColor(UIColor(red: 0.09, green: 0.72, blue: 0.96, alpha: 1), for: .normal)
        btnLogin.titleLabel!.font = UIFont(name: "Helvetica-Regular", size: 18)
        btnLogin.titleLabel!.textAlignment = .center
        btnLogin.setTitle("LOGIN", for: .normal)
        
        // btn SginUp
        
        viewBtnSginUp.layer.backgroundColor = UIColor(red: 0.09, green: 0.72, blue: 0.96, alpha: 1).cgColor
        viewBtnSginUp.layer.cornerRadius = 19
        viewBtnSginUp.layer.borderWidth = 1
        viewBtnSginUp.layer.borderColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1).cgColor
        btnSginUp.titleLabel!.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        btnSginUp.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btnSginUp.titleLabel!.font = UIFont(name: "Helvetica-Regular", size: 18)
        btnSginUp.titleLabel!.textAlignment = .center
        btnSginUp.setTitle("SGIN UP", for: .normal)
    }
    
    
    
    // MARK : Firebase
    
    func firebaseGetTest() {
        let docRef = StaticClass.db.collection("lastid").document("result")
        docRef.getDocument { (document, error) in
            
            if (document?.exists)!
            {
                if let document = document {
                    
                    //new user minor,major value
                    let modelTest = TestModel()
                    modelTest.SetJson(value: document.data())
                    self.testFunc(modelTest: modelTest)
                    
                } else {
                    StaticClass.stopLoad()
                    print("error")
                }
            }
            else{
            // Hata Kontrolü
            }
        }
    }

    }

func firebaseSetData()
{
    let model = TestModel()
    model.minor = 0
    model.major = 12
    
    db.collection("cities").document("LA").setData(model.GetDictForLogin()) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}


func testFunc(modelTest:TestModel) {
    //kode
}

}

