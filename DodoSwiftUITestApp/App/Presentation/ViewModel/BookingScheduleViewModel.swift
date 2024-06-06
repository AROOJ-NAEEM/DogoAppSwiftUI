//
//  BookingScheduleViewModel.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 05/06/2024.
//

import Foundation

class BookingScheduleViewModel: ObservableObject {
    @Published var dogSittersName : [String] = []
    @Published var startTime: String = ""
    
    func fetchData() {
        AuthManager.db
            .collection("dogsitters")
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                self.dogSittersName = snapshot.documents.compactMap { documentSnapshot -> String? in
                    let documentData = documentSnapshot.data()
                    if let name = documentData["name"] as? String {
                        return name
                    } else {
                        return nil
                    }
                }
            }
    }
    
}
