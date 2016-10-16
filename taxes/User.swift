//
//  User.swift
//  taxes
//
//  Created by adhoc on 20/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation

class User{


    let login:String
    let password:String
    
    var nom:String?
    var prenom:String?
    var email:String?
    var tel:String?
    var blocked:Int?
    var nbrCnx:Int?
    
    
    //    private boolean creationTarificationRetardTaxeBoison = true;
    //    private boolean consultationTarificationRetardTaxeBoison = true;
    //
    //    private boolean creationTaxeBoisonTrimistrielle = true;
    //    private boolean consultationTaxeBoisonTrimistrielle = true;
    
    let creationRedevable = true      //0
    let creationActivite = true      //1
    let creationSecteure = true      //2
    let creationUser = true    //3
    
    let taxeBoison = true      //4
    let cloturerBoison = true   //6
    
    let taxeSejour = true  //7
    let cloturerSejour = true   //9
    
    let taxe38 = true  //10
    let cloturer38 = true   //12
    
    let taxe37 = true  //13
    let cloturer37 = true   //15
    
    let taxeTnb = true  //16
    let cloturerTnb = true   //18
    
    let taux=true
    
    var commune:Commune?
    
    init(login:String,password:String,nom:String,prenom:String,email:String,tel:String,blocked:Int,nbrCnx:Int,commune:Commune){
    
        self.login=login
        self.password=password
        self.nom=nom
        self.prenom=prenom
        self.email=email
        self.tel=tel
        self.blocked=blocked
        self.nbrCnx=nbrCnx
        self.commune=commune
    }
    
    init(login:String,password:String){
        self.login=login
        self.password=password
    }
    
    func toAnyObject()->AnyObject{
        return ["login":self.login,"password":self.password]
    }

}
