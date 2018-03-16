//
//  CreateEntry.swift
//  Journal
//
//  Created by Michael J. Huber Jr. on 10/1/17.
//  Copyright © 2017 operation thirteenOne. All rights reserved.
//

import UIKit

class CreateEntry: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet var colorViews: [ColorView]!
    
    var customColor: Entry.CustomColor = .darkGray
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = entry {
            title = "Edit Entry"
            titleTextField.text = entry.title
            bodyTextView.text = entry.body
            
            var tag = entry.tag
            if entry.tag == "Untagged" {
                tag = "Add Tag"
            }
            addTagButton.setTitle(tag, for: .normal)
            colorViews[entry.customColor.rawValue-1].toggle()
        } else {
            title = "Create an Entry"
            colorViews[0].toggle()
        }
        
        
        colorViews.forEach { $0.delegate = self }
        registerForKeyboardNotifications()
    }
    
    @IBAction func addTag() {
        presentAlertController()
    }
    
    @IBAction func save() {
        navigationController?.popViewController(animated: true)

        guard let title = titleTextField.text, !title.isEmpty,
            let body = bodyTextView.text, !body.isEmpty else { return }
        
        titleTextField.text = ""
        bodyTextView.text = "Enter a body..."
        addTagButton.setTitle("Add a Tag", for: .normal)
        colorViews[0].toggle()
        colorViews[customColor.rawValue-1].toggle()
        
        var tag: String? = nil
        if addTagButton.titleLabel?.text != "Add a Tag" {
            tag = addTagButton.titleLabel?.text
        }
        
        EntryController.shared.createEntry(withTitle: title, body: body, tag: tag, color: customColor)
        resignResponders()
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func resignResponders() {
        titleTextField.resignFirstResponder()
        bodyTextView.resignFirstResponder()
    }
    
}

extension CreateEntry: ColorViewDelegate {
    
    func selectColor(customColor: Entry.CustomColor) {
        self.customColor = customColor
        for view in colorViews {
            if view.tag != customColor.rawValue && view.isSelected {
                view.toggle()
            }
        }
    }
    
}

extension CreateEntry {
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Tag", message: "Add a Tag", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter a tag you wish to add..."
        }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addTagAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let textField = alertController.textFields?.first,
                let tag = textField.text, !tag.isEmpty else { return }
            self.addTagButton.setTitle(tag, for: .normal)
        }
        
        alertController.addAction(dismissAction)
        alertController.addAction(addTagAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

extension CreateEntry: KeyboardScrollable {
    
    func keyboardDidShow(_ notification: Notification) {
        keyboardWasShown(notification)
    }
    
    func keyboardWillHide(_ notification: Notification) {
        keyboardWillBeHidden(notification)
    }
    
}






