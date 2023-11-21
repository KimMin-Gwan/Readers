# controller.py
#from constant import *
#from model import Book



# controller에 작성된 내용이 너무 많다면 패키지로 변경할것

# 의존성으로 연결
class Master_Controller():
    def __init__(self, model):
        self.cover_search = Cover_Search_Controller()
        self.book_detail = BookDetailView()
        self.model = model

    def get_book_list_data(self):
        result = self.book_detail.get_data()

        return result


# 베이스 클래스
# 아래에서 상속하여 구현하길 권장
# 상속이 어렵다면 그냥 구현


class ClassWithModel():

    def __init__(self, db):
        pass

    def get_data_from_model(self, *arg):
        pass

# 모델을 사용하는 클래스들

class bookList(ClassWithModel):
    def __init__(self,title):
        self.title = title
        pass

class sortBook(ClassWithModel):
    def __init__(self):
        pass

class BookDetailView(ClassWithModel):
    def __init__(self):
        self.sort = SortBook()
        pass

class Cover_Search_Controller(ClassWithModel):
    def __init__(self):
        pass

class Book(ClassWithModel):
    def __init__(self, db):
        pass

class Review(ClassWithModel):
    def __init__(self,db):
        pass

class ClassWithUserModel(ClassWithModel):

    def __init__(self,uid,id,pw,name,pn,email):

        self.uid = uid
        self.id = id
        self.password = pw
        self.name = name
        self.phonenumber = pn
        self.email = email
        
        pass

    def get_data_from_model(self, *arg):
        pass
    
class User(ClassWithUserModel):

    def getUid():
        pass
    def setUid(uid): #int
        pass
    def getId():
        pass
    def setId(id): #string
        pass
    def getPassword(self):
        pass
    def setPassword(password): #string
        pass
    def getName():
        pass
    def setName(name):
        pass
    def getPhoneNumber():
        pass
    def setPhoneNumber(phoneNumber): # string
        pass 
    def getEmail():
        pass
    def setEmail(Email):
        pass
    def setUser(id,password,name,phoneNumber,email):
        pass

class Register(ClassWithUserModel):
    

    def checkIdDuplication(new_id):

        id #db.id 비교

    def storeId(self,new_id):
        Register.id = new_id  # 입력받은 id를 db에 저장
        print(Register.id)

    def storePassword(password):

        password #db에 저장

    def storeName(name):

        name # db에 저장

class Login(ClassWithUserModel):
        pass


class ClassWithBookModel(ClassWithModel):
    
    class Book(ClassWithModel):
        def __init__(self, db):
            pass