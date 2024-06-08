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
    
    func saveBooking(startTimeSelection: String?, endTimeSelection: String?, sitterSelection: String?, currentDate: Date, complete: @escaping(Bool) -> Void) {
        guard let startTime = startTimeSelection,
              let endTime = endTimeSelection,
              let sitter = sitterSelection
        else {
            print("Booking data incomplete")
            return
        }
        
        guard let currentUserUID = AuthManager.auth.currentUser?.uid else {
            print("User is not authenticated")
            return
        }
        
        let bookingData: [String: Any] = [
            "date": currentDate,
            "startTime": startTime,
            "endTime": endTime,
            "sitter": sitter,
            "userId" : currentUserUID
        ]
        
        AuthManager.db.collection("bookings").addDocument(data: bookingData) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Booking added successfully")
            }
        }
        complete(true)
        
    }
    
}
