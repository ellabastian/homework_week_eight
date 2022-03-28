use library;

create user libraryApp@'%' identified by 'pa$$';
grant execute on procedure library.searchAuthorByFirstName2 to libraryApp;

grant select on library.Book to libraryApp;