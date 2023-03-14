class Book < ApplicationRecord
  def self.search_data(q)
    book = Book.all
    logger.debug '====================' 
    logger.debug book
    # book = [{ name: "ashari" }, { name: "ashari 2" }, {name: 'ashari 3'}]
    book = Book.where("name iLIKE ?", q)
    return { name: book }
  end
end
