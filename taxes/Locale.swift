//
//  Locale.swift
//  taxes
//
//  Created by adhoc on 22/10/1437 AH.
//  Copyright © 1437 AH adhoc. All rights reserved.
//

import Foundation


class Locale {

    //MARK:- PROPERTIES
    var id:CLong?
    var idtc:String?
    var adresse:String?
    var zone:Zone?
    
    var totalTaxeBoisson:Double?
    var totalRetardTaxeBoisson:Double?
    var totalTaxe38:Double?
    var totalRetardTaxe38:Double?
    var totalTaxeTnb:Double?
    var totalRetardTaxeTnb:Double?
    var montantTotalBoisonDu:Double?
    var montantTotalBoisonRetard:Double?
    var montantTotalSejourDu:Double?
    var montantTotalSejourRetard:Double?
    var montantTotalTaxe38Du:Double?
    var montantTotalTaxeTnbDu:Double?
    var montantTotalTaxeTnb:Double?
    var montantTotalTaxe38Retard:Double?
    var montantTotalTaxeTnbRetard:Double?
    
    //37
    var metrageCommercial:Double? // val / -1
    var metrageProfessionelle:Double?
    var metrageIndistruel:Double?
    var ciosqueTel:Int?
    var ciosqueCommercial:Int?
    var metrageStationGazoil:Double?
    var metragePepinaire:Double?
    var metragePanneauElectrique:Double?
    var metragePanneauLumineuxBouge:Double?
    var metragePanneauLumineuxFix:Double?
    var metragePanneauMural:Double?
    var poteau:Int? // 0 / 1
    var metrageToteme:Double?
    var metrageTroutoire:Double?
    
    var anneeDernierPaiementTaxBoison:Int? // jamais paye ==> -1 deja pay ==> >0  n apppartien pas a cette cat ==> -2
    var trimestreDernierPaiementTaxBoison:Int?
    var anneeDernierPaiementTaxSejour:Int?
    var trimestreDernierPaiementTaxSejour:Int?
    var anneeDernierPaiementTax36:Int?
    var trimestreDernierPaiementTax36:Int?
    var anneeDernierPaiementTax38:Int?
    var anneeDernierPaiementTaxTnb:Int?
    var trimestreDernierPaiementTax38:Int?
    
    var anneeDernierPaiementCommercial:Int?
    var trimestreDernierPaiementCommercial:Int?
    var anneeDernierPaiementProfessionelle:Int?
    var trimestreDernierPaiementProfessionelle:Int?
    var anneeDernierPaiementIndistruel:Int?
    var trimestreDernierPaiementIndistruel:Int?
    var anneeDernierPaiementCiosqueTel:Int?
    var trimestreDernierPaiementCiosqueTel:Int?
    var anneeDernierPaiementCiosqueCommercial:Int?
    var trimestreDernierPaiementCiosqueCommercial:Int?
    var anneeDernierPaiementStation:Int?
    var trimestreDernierPaiementStation:Int?
    var anneeDernierPaiementPepinaire:Int?
    var trimestreDernierPaiementPepinaire:Int?
    var anneeDernierPaiementPanneauElectrique:Int?
    var trimestreDernierPaiementPanneauElectrique:Int?
    var anneeDernierPaiementPanneauLumineuxFix:Int?
    var trimestreDernierPaiementPanneauLumineuxBouge:Int?
    var anneeDernierPaiementPanneauLumineuxBouge:Int?
    var trimestreDernierPaiementPanneauLumineuxFix:Int?
    var anneeDernierPaiementPanneauMural:Int?
    var trimestreDernierPaiementPanneauMural:Int?
    var anneeDernierPaiementPoteau:Int?
    var trimestreDernierPaiementPoteau:Int?
    var anneeDernierPaiementToteme:Int?
    var trimestreDernierPaiementToteme:Int?
    var anneeDernierPaiementTroutoire:Int?
    var trimestreDernierPaiementTroutoire:Int?
    //37
    var dernierAnneePaiementAnnuelleTaxeBoisson:Int?
    var dernierAnneePaiementAnnuelleTaxeTnb:Int?
    var dernierAnneePaiementAnnuelleTaxeSejour:Int?
    var dernierAnneePaiementAnnuelleTaxe38:Int?
    var dernierAnneePaiementAnnuelleTaxe37:Int?
    
    var dernierPaiementBoisson:Double?
    var dernierPaiementSejour:Double?
    var dernierPaiementTnb:Double?
    var dernierPaiement38:Double?
    var dernierPaiement37:Double?
    
    var taxeType:Int?
    
    var  categorieSejour:CategorieSejour?
    
    var  categorie37:Categorie37?
    
    var  user:User?
    
    let dateSystem = NSDateFormatter()
    
    var valeurLocation:Double?
    
    var  categorieHabitation:CategorieHabitation?
    var surface:Double?
    
    var  redevable:Redevable?
    
    var  rue:Rue?
    
    var  activite :Activite?
    
    var taxeBoisonAnulles:[TaxeBoisonAnuelle]?
    
    var taxeSejourAnuelles:[TaxeSejourAnuelle]?
    
    var  taxe38Anuelles:[Taxe38Anuelle]?
    
    var locale38Items:[Locale38Item]?
    
    var  infoNotification :InfoNotification?
    
    
    //MARK:- PROPERTIES
    init(adresse:String,rue:Rue?){
    
        self.adresse=adresse
        self.rue=rue
    }
    
    init(){}


}