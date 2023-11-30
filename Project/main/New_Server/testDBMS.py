#from model import User, Book, Review

class Book():
    def __init__(self, bid, title, author, genre,
                publishedDate, introduction, contents,
                  purchaseLink, numSearch, publisher):
        self.bid = bid
        self.title= title
        self.author = author
        self.genre = genre
        self.publishedDate = publishedDate
        self.introduction = introduction
        self.contents = contents
        self.purchaseLink = purchaseLink,
        self.numSearch = numSearch
        self.publisher = publisher

    # detail 반납을 위한 용도 
    def data2DictforDetail(self):
        dict_data = {
            'bid': self.bid,
            'title': self.title,
            'author': self.author,
            'genre': self.genre,
            'publishedDate': self.publishedDate,
            'introduction': self.introduction,
            'contents': self.contents,
            'numSearch': self.numSearch,
            'publisher': self.publisher
        }
        return dict_data
    
    # mainPage에 반환을 위한 용도
    def data2DictforMainPage(self):
        dict_data = {
            'bid': self.bid,
            'title': self.title,
            'author': self.author,
            'publishedDate': self.publishedDate,
            'publisher': self.publisher
        }
        return dict_data
    
    # store 반납을 위한 용도 
    def data2DictforStore(self):
        dict_data = {
            'bid': self.bid,
            'title': self.title,
            'author': self.author,
            'publishedDate': self.publishedDate,
            'numSearch': self.numSearch,
            'publisher': self.publisher
            # 가격?
        }
        return dict_data
    
    # store_detail 반납을 위한 용도 
    def data2DictforStoreDetail(self):
        dict_data = {
            'bid': self.bid,
            'title': self.title,
            'author': self.author,
            'publishedDate': self.publishedDate,
            'numSearch': self.numSearch,
            'publisher': self.publisher
            # 가격 및 구매처?
        }
        return dict_data
    
class User():
    def __init__(self, uid, id, pw, name, phone, email):
        self.uid = uid
        self.id = id
        self.pw = pw
        self.name = name
        self.phone = phone
        self.email = email

class Review():
    def __init__(self, writer, likes, contents, bid, date):
        self.writer = writer # 작성자
        self.likes = likes
        self.contents = contents
        self.bid = bid # 리뷰를 저장한 책의 번호
        self.date = date # 리뷰 작성일


# DB 연결이 없는 환경에서 서버를 테스팅 하기 위한 용도

# 20개의 Book 객체 생성
books = [
    Book(1, "Book1", "Author1", "Genre1", "2022/01/03", "Intro1", "Contents1", "Link1", 10, "Publisher1"),
    Book(2, "Book2", "Author2", "Genre2", "2022/01/01", "Intro2", "Contents2", "Link2", 5, "Publisher2"),
    Book(3, "Book3", "Author3", "Genre3", "2022/01/02", "Intro3", "Contents3", "Link3", 8, "Publisher3"),
    Book(4, "Book4", "Author4", "Genre4", "2022/01/05", "Intro4", "Contents4", "Link4", 15, "Publisher4"),
    Book(5, "Book5", "Author5", "Genre5", "2022/01/04", "Intro5", "Contents5", "Link5", 12, "Publisher5"),
    Book(6, "Book6", "Author6", "Genre6", "2022/01/07", "Intro6", "Contents6", "Link6", 18, "Publisher6"),
    Book(7, "Book7", "Author7", "Genre7", "2022/01/06", "Intro7", "Contents7", "Link7", 20, "Publisher7"),
    Book(8, "Book8", "Author8", "Genre8", "2022/01/09", "Intro8", "Contents8", "Link8", 25, "Publisher8"),
    Book(9, "Book9", "Author9", "Genre9", "2022/01/08", "Intro9", "Contents9", "Link9", 22, "Publisher9"),
    Book(10, "Book10", "Author10", "Genre10", "2022/01/11", "Intro10", "Contents10", "Link10", 30, "Publisher10"),
    Book(11, "Book11", "Author11", "Genre11", "2022/01/10", "Intro11", "Contents11", "Link11", 28, "Publisher11"),
    Book(12, "Book12", "Author12", "Genre12", "2022/01/13", "Intro12", "Contents12", "Link12", 32, "Publisher12"),
    Book(13, "Book13", "Author13", "Genre13", "2022/01/12", "Intro13", "Contents13", "Link13", 35, "Publisher13"),
    Book(14, "Book14", "Author14", "Genre14", "2022/01/15", "Intro14", "Contents14", "Link14", 40, "Publisher14"),
    Book(15, "Book15", "Author15", "Genre15", "2022/01/14", "Intro15", "Contents15", "Link15", 38, "Publisher15"),
    Book(16, "Book16", "Author16", "Genre16", "2022/01/17", "Intro16", "Contents16", "Link16", 45, "Publisher16"),
    Book(17, "Book17", "Author17", "Genre17", "2022/01/16", "Intro17", "Contents17", "Link17", 42, "Publisher17"),
    Book(18, "Book18", "Author18", "Genre18", "2022/01/19", "Intro18", "Contents18", "Link18", 50, "Publisher18"),
    Book(19, "Book19", "Author19", "Genre19", "2022/01/18", "Intro19", "Contents19", "Link19", 48, "Publisher19"),
    Book(20, "Book20", "Author20", "Genre20", "2022/01/21", "Intro20", "Contents20", "Link20", 55, "Publisher20")
]

user = [
    User(1, 'user1', 'pw1', '홍길동', '010-1234-5678', 'user1@email.com'),
    User(2, 'user2', 'pw2', '이순신', '010-2345-6789', 'user2@email.com'),
    User(3, 'user3', 'pw3', '세종대왕', '010-3456-7890', 'user3@email.com'),
    User(4, 'user4', 'pw4', '유관순', '010-4567-8901', 'user4@email.com'),
    User(5, 'user5', 'pw5', '강감찬', '010-5678-9012', 'user5@email.com')
]

class Database():
    def __init__(self):
        print("database testing class")

    def selectAllBook(self):
        return books
    
    def selectBook(self, bid):      

        for book in books:
            if book.bid == bid:
                result = book
                break
            
        return result 
    
    def selectUser(id):
        return user
    
    def insertUser(self, uid, id, pw, name, phone, email):
        user = User(uid, id, pw, name, phone, email)
        return user
        
