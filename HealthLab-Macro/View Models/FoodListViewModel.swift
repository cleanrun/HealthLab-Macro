//
//  FoodListViewModel.swift
//  HealthLab-Macro
//
//  Created by cleanmac-ada on 05/04/22.
//

import Foundation
import Combine

class FoodListViewModel: ObservableObject {
    private var disposeBag = Set<AnyCancellable>()
    
    @Published var searchQuery: String = ""
    @Published var result = FoodResult()
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    init() {
        debounceSearchQuery()
    }
    
    func fetchFoods(query: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        await Webservice.request(endpoint: .Search(query: query), type: FoodResult.self, onSuccess: { [unowned self] response in
            DispatchQueue.main.async {
                self.isLoading = false
                self.result = response
                self.error = nil
            }
        }, onFailed: { error in
            DispatchQueue.main.async {
                self.isLoading = false
                self.error = error
            }
        })
    }
    
    private func debounceSearchQuery() {
        $searchQuery
            .debounce(for: 2, scheduler: RunLoop.main)
            .sink { query in
                if !query.isEmpty && query.count > 2 {
                    Task {
                        await self.fetchFoods(query: "\(query)")
                    }
                }
            }.store(in: &disposeBag)
    }
}
