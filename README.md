# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

-   Ruby version

-   System dependencies

-   Configuration

-   Database creation

-   Database initialization

-   How to run the test suite

-   Services (job queues, cache servers, search engines, etc.)

-   Deployment instructions

-   ...

### Filter

-   find
-   filter

const fruits = ["apple", "banana", "grapes", "mango", "orange"];

function filterItems(arr, query) {
return arr.filter((el) => el.toLowerCase().includes(query.toLowerCase()));
// includes akan merturn jika data query dan data array cocok
// filter akan memfilter berdasarkan data yang true
}

console.log(filterItems(fruits, "ap")); // ['apple', 'grapes']
console.log(filterItems(fruits, "an")); // ['banana', 'mango', 'orange']

### logic searching

1. json data
2. ambil data setiap array,
3. bandingkan datanya dengan keyword,
4. jika keyword banyak maka loop dan compare setiap key dengan data
5. jika sama maka simpan arraynya

### filter data di Ruby
x = ['ashari', 'agus', 'andri']
x.grep(/as/)
return x

## test
