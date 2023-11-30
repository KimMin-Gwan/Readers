# bookmodel을 사용하는 클래스들

class ClassWithBookModel():

    def __init__(self, bid, title, author, genre, publishedDate, introduction,
                 contents, purchaseLink, numSearch, publisher):

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

    def get_data_from_model(self, *arg):
        pass


class Book(ClassWithBookModel):

    def getBid(self):
        return self.bid

    def setBid(self, new_bid):
        self.bid = new_bid

    def getTitle(self):
        return self.title

    def setTitle(self, new_title):
        self.title = new_title

    def getAuthor(self):
        return self.author

    def setAuthor(self, new_author):
        self.author = new_author

    def getGenre(self):
        return self.genre

    def setGenre(self, new_genre):
        self.genre = new_genre

    def getPublishedDate(self):
        return self.publishedDate

    def setPublishedDate(self, new_publishedDate):
        self.publishedDate = new_publishedDate

    def get_data_from_model(self, *arg):
        pass

    def getIntroduction(self):
        return self.introduction

    def setIntroduction(self, new_introduction):
        self.introduction = new_introduction

    def getContents(self):
        return self.contents

    def setContents(self, new_contents):
        self.contents = new_contents

    def setBook(self, new_bid, new_title, new_author, new_genre, new_publishedDate, new_introduction, new_contents):

        self.bid = new_bid
        self.title = new_title
        self.author = new_author
        self.genre = new_genre
        self.publishedDate = new_publishedDate
        self.introduction = new_introduction
        self.contents = new_contents

    def getSale(self):
        pass


class BookList(ClassWithBookModel):

    def __init__(self, title, author, publishedDate, publisher, numberReview, imageCover):

        self.title = title
        self.author = author
        self.publishedDate = publishedDate
        self.publisher = publisher
        # self.numberReview = numberReview
        self.imageCover = imageCover

    def setBookList(self):
        pass

    def loadBookList(self, db):
        pass


class SortBook(ClassWithBookModel):

    def __init__(self, numSearch, publishDate):

        self.numSearch = numSearch
        self.publishedDate = publishDate

    def sortNumSearch(self, numSearch):
        pass

    def sortPublishedDate(self, publishedDate):
        pass


class StringSearch(ClassWithBookModel):

    def __init__(self, title, author, genre, publisher):

        self.title = title
        self.author = author
        self.gerne = genre
        self.publisher = publisher

    def searchTitle(self, title):
        pass

    def searchAuthor(self, author):
        pass

    def searchGenre(self, genre):
        pass

    def searchPublisher(self, publisher):
        pass


class Cover_Search_Controller(ClassWithBookModel):

    def __init__(self):
        pass


class BookDetail(ClassWithBookModel):

    def __init__(self, bid, title, author, genre, contents, publishedDate, introduction):
        self.bid = bid
        self.title = title
        self.author = author
        self.genre = genre
        self.contents = contents
        self.publishedDate = publishedDate
        self.introduction = introduction

    def loadTitle(self, bid, db):
        return self.title
        pass

    def loadAuthor(self, bid, db):
        return self.author
        pass

    def loadGenre(self, bid, db):
        return self.genre
        pass

    def loadContents(self, bid, db):
        return self.contents
        pass

    def loadPublishedDate(self, bid, db):
        return self.publishedDate
        pass

    def loadIntroduction(self, bid, db):
        return self.publishedDate
        pass

    def get_data():
        pass
