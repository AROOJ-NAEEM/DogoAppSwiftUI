//
//  BookingViewModel.swift
//  DogoSwiftUITestApp
//
//  Created by Dev on 08/06/2024.
//

import Foundation
import FirebaseFirestoreInternal

class BookingViewModel: ObservableObject {
    
    @Published var booking : [BookingModel] = []
    
    var groupedBookings: [String: [BookingModel]] {
        var groupedDict: [String: [BookingModel]] = [:]
        
        for booking in self.booking {
            // Extract month and year
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM yyyy"
            let monthYearString = dateFormatter.string(from: booking.date.dateValue())
            
            if var bookingsForMonth = groupedDict[monthYearString] {
                bookingsForMonth.append(booking)
                groupedDict[monthYearString] = bookingsForMonth
            } else {
                groupedDict[monthYearString] = [booking]
            }
        }
        
        return groupedDict
    }
    func fetchBookingData() {
        guard let currentUserUID = AuthManager.auth.currentUser?.uid else {
            print("User is not authenticated")
            return
        }
        
        AuthManager.db
            .collection("bookings")
            .whereField("userId", isEqualTo: currentUserUID)
            .getDocuments { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    //handle error
                    return
                }
                print("Number of documents: \(snapshot.documents.count )")
                self.booking = snapshot.documents.compactMap { documentSnapshot -> BookingModel? in
                    let documentData = documentSnapshot.data()
                    if let date = documentData["date"] as? Timestamp,
                       let startTime = documentData["startTime"] as? String,
                       let endTime = documentData["endTime"] as? String,
                       let sitter = documentData["sitter"] as? String
                    {
                        return BookingModel(date: date, startTime: startTime, endTime: endTime, sitter: sitter)
                    } else {
                        return nil
                    }
                }
            }
    }
}
