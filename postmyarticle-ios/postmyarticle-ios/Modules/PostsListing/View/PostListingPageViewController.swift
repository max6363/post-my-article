//
//  PostListingPageViewController.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import UIKit

final class PostListingPageViewController: UIViewController, PostListingPageViewable {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var profileButton: ProfileButton!
    @IBOutlet var postsFilter: UISegmentedControl!
    @IBOutlet var createPostButton: UIButton!
    
    var presenter: (any PostListingPagePresentable)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.handle(action: .fetchItems)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.handle(action: .reloadData)
        guard let profile = ProfileManager.selectedProfile else { return }
        updateProfileSelection(profile: profile)
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
        createPostButton.layer.cornerRadius = 25
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showLoadingView() {
        view.showLoadingView()
    }
    
    func hideLoadingView() {
        view.hideLoadingView()
    }
    
    func showError(_ error: any Error) {
        //TODO: show error
    }
    
    func updateProfileSelection(profile: ProfileModel) {
        profileButton.configure(
            image: UIImage(systemName: profile.profileThumbnail),
            title: profile.displayName)
    }
}

extension PostListingPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getItems()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = getItem(at: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.configure(postData: item)
        return cell
    }
    
    private func getItem(at indexPath: IndexPath) -> PostModel {
        guard let items = presenter?.getItems() else {
            fatalError("Items not available")
        }
        guard indexPath.row >= 0, indexPath.row < items.count else {
            fatalError("Item is not available for index: \(indexPath.row)")
        }
        return items[indexPath.row]
    }
}

extension PostListingPageViewController {
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        guard let profiles = presenter?.getProfiles() else { return }
        profileButton
            .showMenu(menuItems: profiles.menuDisplayable(),
                      title: "Select Profile") { [weak self] selected in
                guard let profile = selected.dataVal as? ProfileModel else { return }
                self?.presenter?.handle(action: .profileSelected(profile: profile))
        }
        profileButton.showsMenuAsPrimaryAction = true
    }
}

extension PostListingPageViewController {
    @IBAction func onPostFilterChange(control: UISegmentedControl) {
        switch control.selectedSegmentIndex {
        case 0:
            presenter?.handle(action: .selectPostsFilter(filter: .myPosts))
        case 1:
            presenter?.handle(action: .selectPostsFilter(filter: .all))
        default:
            break
        }
    }
}

extension PostListingPageViewController {
    @IBAction func onCreatePostAction(_ sender: UIButton) {
        presenter?.handle(action: .onCreateNewPostClick)
    }
}

extension PostListingPageViewController: UITableViewDelegate {
    //TODO: post selection
}
