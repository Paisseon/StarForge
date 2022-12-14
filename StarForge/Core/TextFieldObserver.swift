//
//  TextFieldObserver.swift
//  StarForge
//
//  Created by Lilliana on 29/11/2022.
//

import Combine
import Dispatch

@MainActor
final class TextFieldObserver: ObservableObject {
    @Published var debouncedText: String = ""
    @Published var searchText: String = ""
    
    init(
        delay: DispatchQueue.SchedulerTimeType.Stride
    ) {
        $searchText
            .debounce(for: delay, scheduler: DispatchQueue.main)
            .assign(to: &$debouncedText)
    }
}
