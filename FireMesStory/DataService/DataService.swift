//
//  DataService.swift
//  FireMesStory
//
//  Created by formathead on 2019/11/06.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit
import Firebase


let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage()
let STORAGE_REF = STORAGE_BASE.reference()

class DataService {
    
    static let instance = DataService()
    
    private var _DB_BASE = DB_BASE
    private var _STO_BASE = STORAGE_BASE
    private var _STO_REF = STORAGE_REF
    private var _STO_IMAGE = STORAGE_REF.child("image")
    
    var REF_BASE: DatabaseReference {
        return _DB_BASE
    }
    
    var STO_BASE: StorageReference {
        return _STO_REF
    }
    
    var STO_REF: StorageReference {
        return _STO_REF
    }
    
    var STO_IMAGE: StorageReference {
        return _STO_IMAGE
    }
    
    
    
    
    
    
}//End Of The Class

