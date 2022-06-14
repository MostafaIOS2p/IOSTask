//
//  HomeViewController.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var photosListTableView: UITableView!

    let homeViewModel = HomeViewModel()
    private var bindings = Set<AnyCancellable>()
    lazy   var searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true);
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Here"
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        bindViewToHomeViewModel()
        bindingViewModelToHomeView()
    }
    func bindViewToHomeViewModel(){
        searchBar.searchTextField.textPublisher.sink { [unowned self] text in
            homeViewModel.searchText.send(text)
            homeViewModel.photoList()
        }.store(in: &bindings)
    }
    func bindingViewModelToHomeView(){
        homeViewModel.photosArray.sink { [unowned self] (_) in
            self.photosListTableView.reloadData()
        }.store(in: &bindings)
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.photosArray.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.autherNameLabel.text = homeViewModel.photosArray.value[indexPath.item].ownername
        cell.imageTitleLabel.text = homeViewModel.photosArray.value[indexPath.item].title
        cell.imageDescriptionLabel.text = homeViewModel.photosArray.value[indexPath.item].description.content
         let image = "https://farm\(homeViewModel.photosArray.value[indexPath.item].farm).staticflickr.com/\(homeViewModel.photosArray.value[indexPath.item].server)/\(homeViewModel.photosArray.value[indexPath.item].id)_\(homeViewModel.photosArray.value[indexPath.item].secret)_w.jpg"
        cell.homeImageView.image = nil
        cell.homeImageView.setImage(url: image)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
