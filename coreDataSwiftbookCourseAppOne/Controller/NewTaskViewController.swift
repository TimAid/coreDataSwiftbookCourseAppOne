//
//  NewTaskViewController.swift
//  coreDataSwiftbookCourseAppOne
//
//  Created by Aid on 06.10.2022.
//

import Foundation
import UIKit
import CoreData




class NewTaskViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Variables
    var dataStorageManager = DataStorageManager()
    
    var taskInfo = TaskEntity()
    
    private lazy var textField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "New task"
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var saveButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("save", for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("cancel", for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textField.delegate = self
        setupSubViews()
        setupConstriants()
    }
    
    //MARK: Methods
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func saveTask() {
        guard let taskText = textField.text else {return}
        dataStorageManager.save(newTask: taskText)
    }
    
    private func setupSubViews() {
        view.addSubview(textField)
        view.addSubview(saveButton)
        view.addSubview(cancelButton)
    }
    
    @objc private func save() {
        saveTask()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:  Methods
    
    //: Contstraints
    private func setupConstriants() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -20),
            cancelButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor, multiplier: 1)
        ])

    }
}
