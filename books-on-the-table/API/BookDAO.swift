//
//  LivrosDAO.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class BookDAO: NSObject {
    
    func retornaTodosLivros() -> Array<SectionBooks> {

        let miseraveis = Book(id: "0", title: "Os Miseráveis", author: "Victor Hugo", type: .drama, status: .reading )
        let pequenoPrincipe = Book(id: "1", title: "O Pequeno Príncipe", author: "Atoine de Saint", type: .drama, status: .reading )
        let senhorDosAneis = Book(id: "2", title: "O Senhor dos Anéis", author: "Tolkien", type: .fantasy, status: .reading )
        let nomeDoVento = Book(id: "3", title: "O Nome do Vento", author: "Patrick Rothfuss", type: .horror, status: .reading )

        let miseraveis2 = Book(id: "4", title: "Os Miseráveis 2", author: "Victor Hugo", type: .horror, status: .done )
        let pequenoPrincipe2 = Book(id: "5", title: "O Pequeno Príncipe 2", author: "Atoine de Saint", type: .horror, status: .done )
        let senhorDosAneis2 = Book(id: "6", title: "O Senhor dos Anéis 2", author: "Tolkien", type: .horror, status: .done )
        let nomeDoVento2 = Book(id: "7", title: "O Nome do Vento 2", author: "Patrick Rothfuss", type: .horror, status: .done )

        let books:Array<Book> = [
            miseraveis,
            pequenoPrincipe,
            senhorDosAneis,
            nomeDoVento,
            miseraveis2,
            pequenoPrincipe2,
            senhorDosAneis2,
            nomeDoVento2
        ]

        let listWithSectios = [
            SectionBooks(title: "Lendo", books: books.filter {$0.status == .reading}),
            SectionBooks(title: "Para ler", books: books.filter {$0.status == .done}),
            SectionBooks(title: "Já lidos", books: books.filter {$0.status == .done}),
        ]
        
        return listWithSectios
    }
}
