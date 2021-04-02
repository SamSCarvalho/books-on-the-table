//
//  LivrosDAO.swift
//  books-on-the-table
//
//  Created by administrator on 3/30/21.
//

import UIKit

class BookDAO: NSObject {
    
    func retornaTodosLivros() -> Array<SectionBooks> {
        let miseraveis = Book(title: "Os Miseráveis", author: "Victor Hugo", type: 1, status: 1 )
        let pequenoPrincipe = Book(title: "O Pequeno Príncipe", author: "Atoine de Saint", type: 1, status: 1 )
        let senhorDosAneis = Book(title: "O Senhor dos Anéis", author: "Tolkien", type: 1, status: 1 )
        let nomeDoVento = Book(title: "O Nome do Vento", author: "Patrick Rothfuss", type: 1, status: 1 )
        
        let miseraveis2 = Book(title: "Os Miseráveis 2", author: "Victor Hugo", type: 1, status: 2 )
        let pequenoPrincipe2 = Book(title: "O Pequeno Príncipe 2", author: "Atoine de Saint", type: 1, status: 2 )
        let senhorDosAneis2 = Book(title: "O Senhor dos Anéis 2", author: "Tolkien", type: 1, status: 2 )
        let nomeDoVento2 = Book(title: "O Nome do Vento 2", author: "Patrick Rothfuss", type: 1, status: 2 )
        
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
            SectionBooks(title: "Lendo", books: books.filter {$0.status == 1 }),
            SectionBooks(title: "Para ler", books: books.filter {$0.status == 2 }),
            SectionBooks(title: "Já lidos", books: books.filter {$0.status == 2 }),
        ]
        
        return listWithSectios
    }
}
