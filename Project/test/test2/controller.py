# controller.py
#from constant import *
import model
from controllerclasses import classeswithbookmodel
from controllerclasses import classeswithreviewmodel
from controllerclasses import classeswithusermodel


# controller에 작성된 내용이 너무 많다면 패키지로 변경할것

# 의존성으로 연결
class Master_Controller():

    def __init__(self, model):

        self.book = classeswithbookmodel.Book()
        self.cover_search = classeswithbookmodel.Cover_Search_Controller()
        self.book_detail = classeswithbookmodel.BookDetail()
        self.booklist = classeswithbookmodel.BookList()

    def get_book_list_data(self):

        result = self.book_detail.get_data()

        return result



