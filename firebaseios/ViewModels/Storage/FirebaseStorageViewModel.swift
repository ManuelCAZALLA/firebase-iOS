//
//  FirebaseStorageViewModel.swift
//  firebaseios
//
//  Created by Manuel Cazalla Colmenero on 15/2/24.
//

import SwiftUI
import FirebaseStorage

class FirebaseStorageViewModel: StorageViewModelProtocol {
    func uploadImage(image: UIImage, onSuccess: @escaping (String) -> Void, onFailure: @escaping (Error) -> Void) {
        
        //guard let imageData = image.pngData() else {
            //onFailure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to convert image to data"]))
           // return
        //}
        
        // Esto es para reducir tamaño de la imagen
        guard let imageData = image.jpegData(compressionQuality: 0.1 ) else {
            onFailure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to convert image to data"]))
            return
        }
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let imageName = "\(UUID().uuidString).jpeg"
        let imageRef = storageRef.child(imageName)
        
        imageRef.putData(imageData, metadata: nil) {metadata, error in
            
            if let error = error {
                onFailure(error)
            }else {
                imageRef.downloadURL { url, error in
                    if let error = error {
                        onFailure(error)
                    }else if let url = url {
                        onSuccess(url.absoluteString)
                    }
                }
            }
        }
    }
}



