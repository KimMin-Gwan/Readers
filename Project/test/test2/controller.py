# controller.py
#from constant import *
from model import UserModel



# controller에 작성된 내용이 너무 많다면 패키지로 변경할것

# 의존성으로 연결
class Master_Controller():
    def __init__(self, model):
        self.cover_search = Cover_Search_Controller()
        self.book_detail = BookDetail()
        self.User = User()
        
    

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


# usermodel을 사용하는 클래스들

class ClassWithUserModel(ClassWithModel):

    def __init__(self,uid,id,pw,name,phonenumber,email):

        self.uid = uid
        self.id = id
        self.password = pw
        self.name = name
        self.phonenumber = phonenumber
        self.email = email

    def get_data_from_model(self, *arg):
        pass
    
class User(ClassWithUserModel):

    def getUid(self):
        return self.uid

    def setUid(self, new_uid): #int
        self.uid = new_uid

    def getId(self):
        return self.id

    def setId(self, new_id): #string
        self.id = new_id

    def getPassword(self):
        return self.password

    def setPassword(self, new_password): #string
        self.password = new_password

    def getName(self):
        return self.name

    def setName(self, new_name):
        self.name = new_name

    def getPhoneNumber(self):
        return self.phonenumber

    def setPhoneNumber(self, new_phonenumber): # string
        self.phonenumber = new_phonenumber

    def getEmail(self):
        return self.email

    def setEmail(self, new_Email):
        self.email = new_Email

    def setUser(self,new_uid,new_id,new_password,new_name,new_phonenumber,new_email):

        self.uid = new_uid
        self.id = new_id
        self.password = new_password
        self.name = new_name
        self.Phonenumber = new_phonenumber
        self.email = new_email

    def get_data_from_model(User, *arg):
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

    def storeEmail(email):
         email
    
    def storePhonenumber(phonenumber):
         phonenumber

    def storeUid(uid):
         uid

    
class Login(ClassWithUserModel):
        
    def __init__(self, id, password):
        self.id = id
        self.password = password         
    
    def getId(self):
        return self.id
    
    def getPassword(self):
        return self.password

    def checkLogin(self, id, password):
        if id == self.getId() and password == self.getPassword():
            return True
        else:
            return False

class Find(ClassWithUserModel):
        
    def __init__(self, email, phonenumber):
        #self.input = input
        self.email = email
        self.phonenumber = phonenumber        

    def findIdPassword(self):
        user
        if user is None:
            return None
        return user
         
class Profile(ClassWithUserModel):
        pass


# bookmodel을 사용하는 클래스들

class ClassWithBookModel(ClassWithModel):

    def __init__(self,bid,title,author,genre,publishedDate,introduction,contents,purchaseLink,numSearch,publisher):

        self.bid = bid
        self.title = title
        self.author = author
        self.genre = genre
        self.publishedDate = publishedDate
        self.introduction = introduction
        self.contents = contents
        self.purchaseLink = purchaseLink
        self.numSearch = numSearch
        self.publisher = publisher
        pass

    def getBid(self):
        return self.bid

    def setBid(self, bid):
        self.bid = bid

    def getTitle(self):
        return self.title

    def setTitle(self, title):
        self.title = title

    def getAuthor(self):
        return self.author

    def setAuthor(self, author):
        self.author = author

    def getGenre(self):
        return self.genre

    def setGenre(self, genre):
        self.genre = genre

    def getPublishedDate(self):
        return self.publishedDate

    def setPublishedDate(self, publishedDate):
        self.publishedDate = publishedDate

    def get_data_from_model(self, *arg):
        pass

    def getIntroduction(self):
        return self.introduction

    def setIntroduction(self, introduction):
        self.introduction = introduction

    def getContents(self):
        return self.contents

    def setContents(self, contents):
        self.contents = contents

    def setBook(bid,title,author,genre,publishedDate,introduction,contents):
        pass

class Book(ClassWithBookModel):
        
    def __init__(self, db):
        pass

class BookList(ClassWithBookModel):
        
    def __init__(self):
        pass

    def setBookList():
        pass

    def loadBookList():
        pass 

class SortBook(ClassWithBookModel):
        
    def __init__(self):
        pass

class BookDetail(ClassWithBookModel):
        
    def __init__(self):
        self.sort = SortBook()
        pass

class Cover_Search_Controller(ClassWithBookModel):
            
    def __init__(self):
        pass

class ClassWithReviewModel(ClassWithModel):

    def __init__(self):
        pass

    def get_data_from_model(self, *arg):
        pass

class Review(ClassWithReviewModel):
     
    def __init__(self):
        pass
    
class WriteReview(ClassWithReviewModel):

    def __init__(self):
        pass

class ReviewList(ClassWithReviewModel):

    def __init__(self,db):
        pass

