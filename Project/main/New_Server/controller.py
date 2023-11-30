# controller.py
from constant import *
from model import *
#from model import Book

# 의존성으로 연결
class Master_Controller():
    def __init__(self, model):
        #self.cover_search = Cover_Search_Controller(model)
        self.book_detail = BookDetailView(model)


    # 책 데이터 요청
    # flag |  "mainPage", "detail", "sale"
    def get_book_data(self, flag): 
        result = self.book_detail.get_data(flag)
        return result
    

# 베이스 클래스
# 아래에서 상속하여 구현하길 권장
# 상속이 어렵다면 그냥 구현

class BookDetailView():
    def __init__(self, model):
        self.model:MasterModel = model

    def get_data(self, flag):
        books = self.model.get_book_list()
        if flag == "mainPage":
            result = self.__sort_book(books, flag="date")  # 날짜 순으로 정렬
            result = result[:len(result)//2] # 전체 데이터 중 1/2만 보내기
            result = self.__book2dict(result, flag=flag) # dict 타입으로 변경
            #print(result)
        elif flag == "detail":
            # 책 상세 정보일때 사용할 내용 추가
            pass
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

        return dictDataList


# EasyOCR 투입해야하므로 이 클래스는 대기
class Cover_Search_Controller():
    def __init__(self):
        pass

