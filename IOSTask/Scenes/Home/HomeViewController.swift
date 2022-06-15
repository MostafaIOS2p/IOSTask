//
//  HomeViewController.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import UIKit
import Combine

class HomeViewController: BaseViewController {

    @IBOutlet weak var photosListTableView: UITableView!

    let homeViewModel = HomeViewModel()
    private var bindings = Set<AnyCancellable>()
    lazy   var searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSearchBar()
        bindViewToHomeViewModel()
        bindingViewModelToHomeView()
        homeViewModel.photoList()
        photosListTableView.keyboardDismissMode = .onDrag
    }
    func prepareSearchBar(){
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Here"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    func bindViewToHomeViewModel(){
        searchBar.searchTextField.textPublisher
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .sink { [unowned self] text in
            homeViewModel.searchText.send(text.trimmingLeadingAndTrailingSpaces())
                AnimationLoading.shared.showSpinner(onView: (self.navigationController?.view)!)
            homeViewModel.photoList()
        }.store(in: &bindings)
    }
    
    func bindingViewModelToHomeView(){
        homeViewModel.photosArray.sink { [unowned self] (_) in
            AnimationLoading.shared.removeSpinner()
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
        cell.photoDetails = homeViewModel.photosArray.value[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "HomeDetails", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeDetailsViewController") as! HomeDetailsViewController
        vc.photoDetails = homeViewModel.photosArray.value[indexPath.row]
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }

}
