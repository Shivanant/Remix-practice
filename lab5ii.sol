// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BookStore {
    struct Book {
        string title;
        string author;
        uint bookId;
        uint price;
    }
    // Mapping from book ID to Book
    mapping(uint => Book) private books;
    // Event for book addition to easily track transactions
    event BookAdded(uint bookId, string title, string author, uint price);

    // Function to add a book
    function setBook(string memory _title, string memory _author, uint _bookId, uint _price) public {
        books[_bookId] = Book(_title, _author, _bookId, _price);
        emit BookAdded(_bookId, _title, _author, _price);
    }

    // Function to get a book's details by ID
    function getBook(uint _bookId) public view returns (string memory, string memory, uint, uint) {
        require(books[_bookId].bookId != 0, "Book not found.");
        Book memory book = books[_bookId];
        return (book.title, book.author, book.bookId, book.price);
    }
}
