# model.py

from DBMS import Databass as DB

# 상속을 사용하여 구현하면 아래와 같이 구현
#class MasterModel(DB):
    #def __init__(self):
        #pass
    #def get_data(self, table, data, ):
        #query = f'select * from {table} where {data}'  # 이것과 유사하게 작성
        #data = self.implement_query(query= query)

# 의존을 통해 구현하면 아래와 같이 구현
class MasterModel():
    def __init__(self):
        self.db = DB()

    def get_data(self, table, data):
        #query = f'select * from {table} where {data}'  # 이것과 유사하게 작성
        #data = self.db.implement_query(query= query)
        data = Book()
        return data
        pass


# Book 클래스
class Book:
    bid:int = -1
    title:str = "Default"
    author:str = "Default"
    genre:str = "Default"
    contents:str = "contents" # 이건 다른 클래스로 빼도됨
    publishedDate:str = "date"
    introduction:str = "Default" # 뭔지 모름
# ws
# http://www.naver.com/book.png

# UserModel : db의 사용자 정보를 받아올 클래스
class UserModel:
    utd:int = 0
    id:str = "Default"
    password:str = "Default"
    name:str = "Default"
    PhoneNumber:int = "Default"
    email:str = "Default"

class ReviewModel:
    writer:str = "Default"
    likes:int = 0
    contents:str = "Default"
    bid:int = 0

