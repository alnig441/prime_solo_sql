1. Which authors are represented in our store?
SELECT * FROM authors
1111;"Denham";"Ariel"
1212;"Worsley";"John"
15990;"Bourgeois";"Paulette"
25041;"Bianco";"Margery Williams"
16;"Alcott";"Louisa May"
4156;"King";"Stephen"
1866;"Herbert";"Frank"
1644;"Hogarth";"Burne"
2031;"Brown";"Margaret Wise"
115;"Poe";"Edgar Allen"
7805;"Lutz";"Mark"
7806;"Christiansen";"Tom"
1533;"Brautigan";"Richard"
1717;"Brite";"Poppy Z."
2112;"Gorey";"Edward"
2001;"Clarke";"Arthur C."
1213;"Brookins";"Andrew"
25043;"Simon";"Neil"
1809;"Geisel";"Theodor Seuss"


2. Which authors are also distinguished authors?
SELECT * FROM authors RIGHT JOIN distinguished_authors ON authors.id = distinguished_authors.id
25043;"Simon";"Neil";25043;"Simon";"Neil";"Pulitzer Prize"
1809;"Geisel";"Theodor Seuss";1809;"Geisel";"Theodor Seuss";"Pulitzer Prize"


3. Which authors are not distinguished authors?
SELECT * FROM authors LEFT JOIN distinguished_authors ON authors.id = distinguished_authors.id WHERE award is null
1111;"Denham";"Ariel";;"";"";""
1212;"Worsley";"John";;"";"";""
15990;"Bourgeois";"Paulette";;"";"";""
25041;"Bianco";"Margery Williams";;"";"";""
16;"Alcott";"Louisa May";;"";"";""
4156;"King";"Stephen";;"";"";""
1866;"Herbert";"Frank";;"";"";""
1644;"Hogarth";"Burne";;"";"";""
2031;"Brown";"Margaret Wise";;"";"";""
115;"Poe";"Edgar Allen";;"";"";""
7805;"Lutz";"Mark";;"";"";""
7806;"Christiansen";"Tom";;"";"";""
1533;"Brautigan";"Richard";;"";"";""
1717;"Brite";"Poppy Z.";;"";"";""
2112;"Gorey";"Edward";;"";"";""
2001;"Clarke";"Arthur C.";;"";"";""
1213;"Brookins";"Andrew";;"";"";""


4. How many authors are represented in our store?
SELECT COUNT(*) FROM authors
19

5. Who are the favorite authors of the employee with the first name of Michael?
SELECT * FROM employees RIGHT JOIN favorite_authors ON employees.id = favorite_authors.employee_id
102;"Holloway";"Michael";102;"{{"J.R.R. Tolkien","The Silmarillion"},{"Charles Dickens","Great Expectations"},{"Ariel Denham","Attic Lives"}}"

6. What are the titles of all the books that are in stock today?
SELECT * FROM daily_inventory JOIN editions ON daily_inventory.isbn = editions.isbn
JOIN books ON books.id = book_id
WHERE daily_inventory.is_stocked is true
"039480001X";t;"039480001X";1608;1;59;"1957-03-01";"h";1608;"The Cat in the Hat";1809;2
"044100590X";t;"044100590X";4513;3;99;"1999-10-01";"h";4513;"Dune";1866;15
"0441172717";t;"0441172717";4513;2;99;"1998-09-01";"p";4513;"Dune";1866;15


7. Insert one of your favorite books into the database. Hint: You’ll want to create data in at least 2 other tables to completely create this book.
INSERT INTO authors VALUES ( 666, 'Burroughs', 'William S.' );
INSERT INTO books VALUES ( 1000, 'The Naked Lunch', 666, 9 );
INSERT INTO editions VALUES ( '9783548028439', 1000, 5, 13, '2002-01-01', 'p' );

8. What authors have books that are not in stock?
SELECT * FROM daily_inventory JOIN editions ON daily_inventory.isbn = editions.isbn
JOIN books ON books.id = book_id
WHERE daily_inventory.is_stocked is false
"0451198492";f;"0451198492";4267;3;101;"1999-10-01";"h";4267;"2001: A Space Odyssey";2001;15
"0394900014";f;"0394900014";1608;1;59;"1957-01-01";"p";1608;"The Cat in the Hat";1809;2
"0451160916";f;"0451160916";7808;1;75;"1981-08-01";"p";7808;"The Shining";4156;9


9. What is the title of the book that has the most stock?
SELECT * FROM stock WHERE stock=(SELECT max(stock) from stock)
SELECT * FROM books JOIN editions ON books.id = editions.book_id
JOIN stock ON stock.isbn = editions.isbn 
WHERE stock=(SELECT max(stock) FROM stock)
4513;"Dune";1866;15;"044100590X";4513;3;99;"1999-10-01";"h";"044100590X";36.00;45.95;89
