//
//  HomeViewModel.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import Foundation
import Combine

class HomeViewModel{
    
    var searchText = CurrentValueSubject<String,Never>("a")
    
    private var subscriptions = Set<AnyCancellable>()
    var photosArray = CurrentValueSubject<[Photo],Never>([Photo]())

    
    func photoList() {
        searchText.sink { text in
            print(text)
            PhotoListRepository().searchPhotos(query: text).sink { completion in
                switch completion{
                case .failure(let erro):
                    print(erro.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [unowned self] list in
                photosArray.send(list.photos.photo)
            }.store(in: &self.subscriptions)
        }.store(in: &subscriptions)
    }
}
