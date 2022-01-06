//
//  DailyWeatherCell.swift
//  Weather
//
//  Created by lion on 3.01.22.
//

import UIKit



final class DailyWeatherCell: UITableViewCell {

    static let identifier = "DailyWeatherCell"
    
//MARK: - Creating Views
   private let conteinerView: UIView = {
       let view = UIView()
        view.setCornerRadius(with: 5.0)
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "system", size: 14.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "system", size: 12.0)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
  
    var dataModelCell: DailyWeatherCellModel? {
        didSet {
            compleateDataCell()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewSetup()
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // метод, для заполнения лэйблов в ячейке
    private func compleateDataCell() {
        dateLabel.text = dataModelCell?.dateString
        if let tempMin = dataModelCell?.tempMinString, let tempMax = dataModelCell?.tempMaxString {
            tempLabel.text = tempMin + "º" + "   " + tempMax + "º"
        }
    }
    
//MARK: - viewSetup, makeConstraints
    private func viewSetup() {
        addSubview(conteinerView)
        conteinerView.addSubview(dateLabel)
        conteinerView.addSubview(tempLabel)
        
        conteinerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(16)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(12)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(12)
            make.leading.equalTo(dateLabel.snp.trailing).offset(12)
        }
    }
    
    
    
 
}







