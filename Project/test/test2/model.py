# model.py
import pymysql
from pydantic import BaseModel
from Project.main.Server.DBMS import Database as DB


# 상속을 사용하여 구현하면 아래와 같이 구현

class MasterModel(DB):

    def __init__(self):
        pass

    def get_data(self, table, data):
        query = f'select * from {table} where {data}'  # 이것과 유사하게 작성
        # data = self.( query = query )


# 의존을 통해 구현하면 아래와 같이 구현
# class MasterModel():

#     def __init__(self):
#         self.db = DB()

#     def get_data(self, table, data):
#         #query = f'select * from {table} where {data}'  # 이것과 유사하게 작성
#         #data = self.db.implement_query(query = query)
#         data = Book()
#         return data
class User(BaseModel):
    uid: int = 0
    id: str = "Default"
    password: str = "Default"
    phoneNumber: int = "Default"
    email: str = "Default"


class UserModel(DB):

    def add_user(self, id, password, name, phoneNumber, email):
        DB.insertUser(self,id=id, password=password, name=name, phoneNumber=phoneNumber, email=email)

    def get_user(self, id):
        DB.selectUser(self, id=id)

    def update_user(self, id, password, name, phoneNumber, email):
        DB.updateUser(self, id=id, password=password, name=name, phoneNumber=phoneNumber, email=email)

    def delete_user(self, id):
        DB.deleteUser(self,id=id)


class Book(BaseModel):
    bid: int = 0
    title: str = "Default"
    author: str = "Default"
    genre: str = "Default"
    contents: str = "contents"  # 이건 다른 클래스로 빼도됨
    publishedDate: str = "date"
    purchasedLink: str = "defualt"
    introduction: str = "Default"  # 뭔지 모름
    numSearch: int = 0
    publisher: str = "default"


class BookModel(DB):

    # def add_book(self,bid, title, author, genre, introduction, contents, purchaseLink, numSearch, publishedDate, publisher):
    #  query = "INSERT INTO users (username, password, name, email, phonenumber) VALUES (%s, %s, %s, %s, %s)"
    #  values = (username, password, name, email, phonenumber)
    #  self.cursor.execute(query, values)
    # self.conn.commit()
    #  return self.cursor.lastrowid

    def get_book(self, bid):
        DB.selectBook(bid=bid)

    def selectBookByTitle(self, title):
        DB.selectBookByTitle(title=title)

    def selectBookByGenre(self, genre):
        DB.selectBookByGenre(genre=genre)

    def selectBookByTitle(self, title):
        DB.selectBookByTitle(title=title)

    def selectAllBook(self):
        DB.selectAllBook(self)

    # def delete_book(self, bid):
    # query = "DELETE FROM users WHERE bid = %s"
    # self.cursor.execute(query, (bid,))
    # self.conn.commit()


# Book 클래스


class Review(BaseModel):
    writer: str = "Default"
    likes: int = 0
    contents: str = "Default"
    bid: int = 0


class ReviewModel(DB):

    def selectReview(self, bid, writer):
        DB.selectReview(bid=bid, writer=writer)

    def insertReview(self, bid, writer, contents):
        DB.insertReview(bid=bid, writer=writer, contents=contents)

    def delete_Review(self, bid, writer):
        DB.insertReview(bid=bid, writer=writer)

    def selectReviewByTitle(self, title):
        DB.selectBookByTitle(title=title)
