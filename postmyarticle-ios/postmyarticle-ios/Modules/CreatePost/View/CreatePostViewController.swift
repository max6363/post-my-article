//
//  CreatePostViewController.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import UIKit

final class CreatePostViewController: UIViewController, CreatePostViewable {
    @IBOutlet var profileButton: ProfileButton!
    @IBOutlet var text: UITextView!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var contentImage: UIImageView!
    
    var presenter: (any CreatePostPresentable)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.delegate = self
    }
    
    func updateProfileSelection(profile: ProfileModel) {
        profileButton.configure(
            image: UIImage(systemName: profile.profileThumbnail),
            title: profile.displayName)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

extension CreatePostViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        presenter?.handle(action: .saveText(textView.text))
    }
}

extension CreatePostViewController {
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

extension CreatePostViewController {
    @IBAction func onSubmitButtonAction(_ sender: UIButton) {
        self.view.endEditing(true)
        presenter?.handle(action: .submit)
    }
}

extension CreatePostViewController {
    @IBAction func onCloseButtonAction(_ sender: UIButton) {
        presenter?.handle(action: .pageBack)
    }
}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func onAddImageButtonAction(_ sender: UIButton) {
        presentImagePickerOptions()
    }
    
    private func presentImagePickerOptions() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)

        // Camera Option
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
                self.presentImagePicker(sourceType: .camera)
            })
        }

        // Photo Library Option
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.presentImagePicker(sourceType: .photoLibrary)
        })

        // Cancel option
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    private func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        imagePicker.allowsEditing = true // Optional: allows image editing

        present(imagePicker, animated: true, completion: nil)
    }

    // UIImagePickerControllerDelegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        picker.dismiss(animated: true, completion: nil)

        if let editedImage = info[.editedImage] as? UIImage {
            contentImage.image = editedImage
            presenter?.handle(action: .saveImage(editedImage))
        } else if let originalImage = info[.originalImage] as? UIImage {
            contentImage.image = originalImage
            presenter?.handle(action: .saveImage(originalImage))
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

