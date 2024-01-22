// CountryCitySelectionView.swift
// Role: View in MVVM architecture.
// Responsibilities: Responsible for presenting the UI elements, particularly the tableView.
// This view is managed by CountryCitySelectionViewController and is agnostic of business logic.

import UIKit

class CountryCitySelectionView: UIView {
    // UITableView to display the list of countries. It's set up programmatically.
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false // Using Auto Layout
        return table
    }()
    
    // Initializer for the view
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView) // Add tableView as a subview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell") // Register cell type
        setupConstraints() // Set up Auto Layout constraints for tableView
    }
    
    // Required initializer for using a custom view in Interface Builder, not implemented here.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Private method to set up constraints for the tableView to fill the entire view
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
}
