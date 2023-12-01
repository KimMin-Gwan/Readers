# controller.py
from constant import *
from model import *
#from model import Book

# 의존성으로 연결
class Master_Controller():
    def __init__(self, model):
        #self.cover_search = Cover_Search_Controller(model)
        self.book_detail = BookDetailView(model)
        self.login = LoginView(model)
        self.register = RegisterView(model)
        self.find = FindView(model)
        self.review = ReviewView(model)

    # 책 데이터 요청
    # flag |  "mainPage", "detail", "sale", "sale_detail"
    def get_book_data(self, flag, bid = None): 
        result = self.book_detail.get_data(flag, bid)
        return result
    
    # 유저 id, pw 정보 요청
    def get_login_data(self, id, pw):
        result = self.login.checkLogin(id, pw) 
        return result
    
    def get_user_data(self, uid, id, pw, name, phone, email):
        result = self.register.checkIdDuplication(uid, id, pw, name, phone, email)
        return result
    
    # id찾기
    def get_id_data(self, name, email):
        result = self.find.get_ID(name, email)
        return result
    
    # pw찾기
    def get_pw_data(self, id, name, email):
        result = self.find.get_PW(id, name, email)
        return result
    
    # review 요청
    def get_review_data(self, bid, writer = None):
        result = self.review.get_review(bid, writer)
        return result
    

# 베이스 클래스
# 아래에서 상속하여 구현하길 권장
# 상속이 어렵다면 그냥 구현

class BookDetailView():
    def __init__(self, model):
        self.model:MasterModel = model

    def get_data(self, flag, bid):
        
        # 메인 페이지
        if flag == "mainPage":
            books = self.model.get_book_list()
            result = self.__sort_book(books, flag="date")  # 날짜 순으로 정렬
            result = result[:len(result)//2] # 전체 데이터 중 1/2만 보내기
            result = self.__book2dict(result, flag=flag) # dict 타입으로 변경
            #print(result)

        # 책 상세정보
        elif flag == "detail":
            book = self.model.get_book(bid)
            result = self.__book2dict(book, flag="detail")
            # 책 상세 정보일때 사용할 내용 추가

        # 구매 페이지
        elif flag == "store":
            books = self.model.get_book_list()
            # 정렬 생략
            result = self.__book2dict(result, flag="store") # dict 타입으로 변경
            
        # 구매 상세 페이지
        elif flag == "store_detail":
            book = self.model.get_book(bid)
            result = self.__book2dict(book, flag="store_detail")
        
        return result

    # 정렬을 위한 함수
    def __sort_book(self, result, flag):
        # 날짜 단위로 정렬

        if flag == "date":
            sorted_books = sorted(result, key=lambda x: x.publishedDate)
        elif flag == "title":
            sorted_books = sorted(result, key=lambda x: x.title)
        # 추가 구현 가능
        else:
            sorted_books = result

        return sorted_books

    # 클래스 데이터를 딕셔너리 형태로 변경
    def __book2dict(self, bookList, flag):
        dictDataList = []

        # 메인 페이지 일때
        if flag == "mainPage":
            print("hello")
            for book in bookList:
                result = book.data2DictforMainPage()
                #print(result)
                dictDataList.append(result)

        # 디테일 페이지 일때
        elif flag == "detail":
            for book in bookList:
                result = book.data2DictforDetail()
                dictDataList.append(result)

        # 도서구매 페이지 일때
        elif flag == "store":
            for book in bookList:
                result = book.data2DictforStore()
                dictDataList.append(result)

        # 도서구매 상세페이지 일때
        elif flag == "store_detail":
            for book in bookList:
                result = book.data2DictforStoreDetail()
                dictDataList.append(result)

        return dictDataList

# 로그인 클래스   
class LoginView():
    def __init__(self, model):
        self.model:MasterModel = model


    # 로그인 함수
    def checkLogin(self, id, pw):
        id_result = self.model.find_valid_id(id)

        if id_result == None:
            return {"result":"false", "uid":-1}
        
        # id를 넣으면 pw가 나오는 함수
        pw_result, uid = self.model.find_pw(id)  

        if pw != pw_result:
            return {"result":"false", "uid":-1}
        else:
            return {"result":"true", "uid":uid}

# 회원가입
class RegisterView():
    def __init__(self, model):
        self.model:MasterModel = model

    # ID 중복 확인
    def checkIdDuplication(self, uid, id, pw, name, phone, email):
        id_result = self.model.find_valid_id(id)
        if len(id_result) != 0:
            return {"result":"false"}
        else:
            self.model.insertUser(uid, id, pw, name, phone, email)
            return {"result":"true"}


 # 아이디, 비밀번호 찾기           
class FindView():
    def __init__(self, model):
        self.model:MasterModel = model

    def get_ID(self, name, email):
        result = self.model.get_id(name, email)
        return {"id" : result}

    def get_PW(self, id, name, email):
        result = self.model.get_pw(id, name, email)
        return {"pw" : result}

# 상품 

# 리뷰
class ReviewView():
    def __init__(self, model):
        self.model:MasterModel = model

    def get_review(self, bid, writer):
        reviews = self.model.get_review_list(bid)
        result = self.__sort_review(reviews, flag="date")  # 날짜 순으로 정렬
        result = self.__review2dict(result) # dict 타입으로 변경

        return result
    

    def __sort_review(self, result, flag):
        # 날짜 단위로 정렬

        if flag == "date":
            sorted_reviews = sorted(result, key=lambda x: x.date)
        #elif flag == "likes":
        #    sorted_reviews = sorted(result, key=lambda x: x.title)
        # 추가 구현 가능
        else:
            sorted_reviews = result

        return sorted_reviews


    def __review2dict(self, reviewList):
        dictReviewList = []
        for review in reviewList:
            result = review.review2Dict(review)
            dictReviewList.append(result)

        return dictReviewList

# EasyOCR 투입해야하므로 이 클래스는 대기
class Cover_Search_Controller():
    def __init__(self):
        pass

