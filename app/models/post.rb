class Post < ApplicationRecord
  belongs_to :user

  has_many :likes, as: :likeable
  has_many :comments, dependent: :destroy

  def self.search_data(q)
    book = Book.all
    logger.debug '====================' 
    logger.debug book
    # book = [{ name: "ashari" }, { name: "ashari 2" }, {name: 'ashari 3'}]
    book = Book.where("name iLIKE ?", q)
    return { name: book }
  end
end
