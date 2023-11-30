# controller.py
# from constant import *
from model import Book
from model import User
from controllerclasses import classeswithbookmodel
from controllerclasses import classeswithreviewmodel
from controllerclasses import classeswithusermodel


# controller에 작성된 내용이 너무 많다면 패키지로 변경할것

# 의존성으로 연결

class Master_Controller():

    def __init__(self):
        pass

    class User(classeswithusermodel.User):
        pass

    class Register(classeswithusermodel.Register):
        pass

    class Login(classeswithusermodel.Login):
        pass

    class Find(classeswithusermodel.Find):
        pass

    class Profile(classeswithusermodel.Profile):
        pass

    class Book(classeswithbookmodel.Book):
        pass

    class BookList(classeswithbookmodel.BookList):
        pass

    class SortBook(classeswithbookmodel.SortBook):
        pass

    class StringSearch(classeswithbookmodel.StringSearch):
        pass

    class Cover_Search_Controller(classeswithbookmodel.Cover_Search_Controller):
        pass

    class BookDetail(classeswithbookmodel.BookDetail):
        pass

    class Review(classeswithreviewmodel.Review):
        pass

    class WriteReview(classeswithreviewmodel.WriteReview):
        pass

    class ReviewList(classeswithreviewmodel):
        pass
