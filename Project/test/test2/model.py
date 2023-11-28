# model.py

from dbms import Database as DB

# 상속을 사용하여 구현하면 아래와 같이 구현

class MasterModel(DB):

    def __init__(self):
        pass

    def get_data(self, table, data):
        query = f'select * from {table} where {data}'  # 이것과 유사하게 작성
        data = self.implement_query( query = query )

# 의존을 통해 구현하면 아래와 같이 구현
# class MasterModel():

#     def __init__(self):
#         self.db = DB()

#     def get_data(self, table, data):
#         #query = f'select * from {table} where {data}'  # 이것과 유사하게 작성
#         #data = self.db.implement_query(query = query)
#         data = Book()
#         return data

class BookModel(DB):

    def __init__(self):
        self.book = Book()
        pass

    def get_data(self, book):
        query = f'select * from {book}'
        # 이것과 유사하게 작성
        data = DB.cursor.execute(query)
        rows = DB.fetchall()
        return book(data)


# Book 클래스
class Book():
    bid:int = -1
    title:str = "Default"
    author:str = "Default"
    genre:str = "Default"
    contents:str = "contents" # 이건 다른 클래스로 빼도됨
    publishedDate:str = "date"
    introduction:str = "Default" # 뭔지 모름

# ws
# http://www.naver.com/book.png

# UserModel

class UserModel(DB):

    def __init__(self):
        self.user = User() 
        pass

    def get_data(self, user):
        query = f'select * from {user}'
        # 이것과 유사하게 작성
        #data = self.implement_query( query = query)
        pass

class User:
    uid:int = 0
    id:str = "Default"
    password:str = "Default"
    name:str = "Default"
    PhoneNumber:int = "Default"
    email:str = "Default"

class ReviewModel(DB):

    def __init__(self):
        self.review = Review()
        pass

    def get_data(self, review):
        query = f'select * from {review}'
        # 이것과 유사하게 작성
        #data = self.implement_query( query = query)
        pass


class Review:
    writer:str = "Default"
    likes:int = 0
    contents:str = "Default"
    bid:int = 0

