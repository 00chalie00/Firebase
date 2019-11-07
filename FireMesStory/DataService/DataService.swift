//
//  DataService.swift
//  FireMesStory
//
//  Created by formathead on 2019/11/06.
//  Copyright © 2019 formathead. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore




let DB_BASE = Database.database().reference()
let STORAGE_BASE = Storage.storage()
let STORAGE_REF = STORAGE_BASE.reference()

class DataService: UIViewController {
    
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
    
    func getPost(image: UIImage, comment: String) {
        let uid = Auth.auth().currentUser?.uid
        let imageData = image.jpegData(compressionQuality: 0.5)
        let imageSubFolder = STO_IMAGE.child("\(uid!).jpg")
        imageSubFolder.putData(imageData!, metadata: nil) { (returnMetadata, error) in
            guard let metadata = returnMetadata else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                return
            }
            print(metadata)
            imageSubFolder.downloadURL { (url, error) in
                guard let url = url else {
                    print("URL Download is failed")
                    return
                }
                print(url)
                let imageUrl = url.absoluteString
                
                let fireStoreDatabase = Firestore.firestore()
                let fireStorePost = ["image": imageUrl,
                                     "postedBy": Auth.auth().currentUser!.email!,
                                     "comment": comment,
                                     "date": FieldValue.serverTimestamp()] as [String : Any]
                var fireStoreReference: DocumentReference? = nil
                fireStoreReference = fireStoreDatabase.collection("Posts").addDocument(data: fireStorePost, completion: { (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        print("Documend saved ID: \(fireStoreReference!.documentID)")
                    }
                })
                
                
            }
        }
    }
    
}//End Of The Class

