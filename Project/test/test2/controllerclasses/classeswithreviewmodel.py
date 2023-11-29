# reviewmodel을 사용하는 클래스들

class ClassWithReviewModel():

    def __init__(self, writer, likes, contents, bid, date):
        self.writer = writer
        self.likes = likes
        self.contents = contents
        self.bid = bid
        self.date = date

    def get_data_from_model(self, *arg):
        pass


class Review(ClassWithReviewModel):

    def __init__(self, writer, likes, contents, bid, date):
        self.writer = writer
        self.likes = likes
        self.contents = contents
        self.bid = bid
        self.date = date

    def getWriter(self):
        return self.writer

    def setWriter(self, writer):
        self.writer = writer

    def getLikes(self):
        return self.likes

    def setLikes(self, likes):
        self.likes = likes

    def getContents(self):
        return self.contents

    def setContnets(self, contents):
        self.contents = contents

    def getBid(self):
        return self.bid

    def setBid(self, bid):
        self.bid = bid

    def getDate(self):
        return self.date

    def setData(self, date):
        self.date = date


class WriteReview(ClassWithReviewModel):

    def __init__(self, rating, contents, bid):
        self.rating = rating
        self.contents = contents
        self.bid = bid

    def storeRating(rating):
        pass

    def storeContents(contents):
        pass

    def loadWriterList(self, db):
        pass

    def loadTitleList(self, db):
        pass

    def loadDatesList(self, db):
        pass

    def loadRatingList(self, db):
        pass

    def loadLikesList(self, db):
        pass

    def loadContentsList(self, db):
        pass

    def get_data_from_model(self, *arg):
        pass


class ReviewList(ClassWithReviewModel):

    def __init__(self, title, writer, contents, date, likes, search):
        self.title = title
        self.writer = writer
        self.contents = contents
        self.date = date
        self.likes = likes
        self.search = search
        pass

    def setReviewList(self, title, writer, contents, date, likes, search):
        pass

    def loadReviewList(self, db):
        pass

    def searchReviewList():
        pass