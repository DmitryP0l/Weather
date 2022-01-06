//
//  WeatherDetailsVC.swift
//  Weather
//
//  Created by lion on 3.01.22.
//

import UIKit
import SnapKit

final class WeatherDetailsVC: UIViewController {
    
    lazy var interactor: WeatherDetailsInteractor = {
        let interactor = WeatherDetailsInteractor()
        interactor.vc = self
        return interactor
    }()
    // создание экземпляров классов вьюх
    private let dailyWeatherDetailsView = DailyWeatherDetailsView()
    private let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewSetup()
        tableViewSetup()
    }
    
//MARK: - viewSetup, makeConstraints
    private func viewSetup() {
        view.addSubview(dailyWeatherDetailsView)
        view.addSubview(tableView)
        // ставим констрейнты
        dailyWeatherDetailsView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        tableView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview().inset(10)
            make.top.equalTo(dailyWeatherDetailsView.snp.bottom).offset(16)
            
        }
        tableView.separatorStyle = .none
        // попытка добавить тени для таблицы
        tableView.layer.shadowColor = UIColor.red.cgColor
        tableView.layer.shadowRadius = 1.0
        tableView.layer.shadowOpacity = 10.0
        
    }
    
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyWeatherCell.self, forCellReuseIdentifier: DailyWeatherCell.identifier)
        
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension WeatherDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherCell.identifier, for: indexPath) as! DailyWeatherCell
        cell.dataModelCell = interactor.dataSource[indexPath.row]
        // убираем визуал нажатия по ячейке
        cell.selectionStyle = .none
        // уставливаем кастомный сепаратор из экстеншена
        if indexPath.row > 0 {
            cell.addSeparatorLine(color: .black, width: Int(view.frame.size.width), height: 2)
        }
        
        //закругляем выбранные края таблицы
        let cornerRadius = 15
        var corners: UIRectCorner = []
        
        if indexPath.row == 0 {
            corners.update(with: .topLeft)
            corners.update(with: .topRight)
        }
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            corners.update(with: .bottomLeft)
            corners.update(with: .bottomRight)
        }
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: cell.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        cell.layer.mask = maskLayer
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
