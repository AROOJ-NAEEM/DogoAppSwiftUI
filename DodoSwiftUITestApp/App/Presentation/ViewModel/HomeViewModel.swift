//
//  HomeViewModel.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 04/06/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var dogSitters : [DogSitterModel] = []
    @Published var isLoading: Bool = true
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        LogService.log("Fetch: Start")
        AuthManager.db
            .collection("dogsitters")
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    return
                }
                LogService.log("Number of documents: \(snapshot.documents.count )")
                self.dogSitters = snapshot.documents.compactMap { documentSnapshot -> DogSitterModel? in
                    let documentData = documentSnapshot.data()
                    if let name = documentData["name"] as? String, let rating = documentData["rating"] as? Int, let charges = documentData["charges"] as? Int, let profile = documentData["profile"] as? String, let tours = documentData["tours"] as? Int {
                        self.isLoading = false
                        LogService.log("Fetch: Successfull")
                        return DogSitterModel(name: name, rating: rating, charges: charges, profile: profile, tours: tours)
                    } else {
                        LogService.log("Fetch: Unsuccessfull")
                        return nil
                    }
                }
            }
    }
    
}
