//
//  ViewController.swift
//  ZipOperator
//
//  Created by Fernando Mota e Silva on 23/04/18.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var search: UISearchBar!
    
    @IBOutlet weak var textView: UITextView!
    
    let bag = DisposeBag()
    
    let useCase = PersonUseCase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViews()
        
    }
    
    func bindViews() {
        
        search.rx.text.orEmpty
            .filter { (query) -> Bool in
                return !query.isEmpty
        }
        .debounce(1.5, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .do (onNext: { (value) in
                print("ligar o coiso")
        })
        .map { query  in
            return self.useCase.findPersonsByName(name: query)
        }
        .flatMap{ persons in
            return Observable.from(persons)
        }
        .flatMap { person in
            return Observable.zip(Observable.just(Pessoa(nome: person.name, amigos: [])),
                                  Observable.from(self.useCase.findFriendsByPersonId(personId: person.id))
                                    .map{ friend in
                                        return Amigo(nome: friend.name)
                                    }.toArray()
                                    ,
                                  resultSelector: { (pessoa, amigos) -> Pessoa in
                                    pessoa.amigos = amigos
                return pessoa
            })
        }
        .subscribe(onNext: { [weak self] pessoa in
            guard let result = self?.textView.text else {return}
            self?.textView.text = result + "\n\(pessoa.toString())"
        }).disposed(by: bag)
    }

    
    @IBAction func clear(_ sender: UIButton) {
        textView.text = ""
    }
}
