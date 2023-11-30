
from testDBMS import Database
#from DBMS import Database



class MasterModel():
    def __init__(self):
        # dbms 연결
        self.dbms = Database()

    ## dbms 연결 확인용 함수
    #def test_query(self):
        #result = self.dbms.selectAll()

        #if result == None:
            #print("DBMS ERROR || Connection Check")
        #else:
            #print(result)      
        #return
    
    # 책 리스트 호출 
    def get_book_list(self):
        result = []
        try:
            # 책 데이터는 전부다 가지고 온다
            # List<Book>
            result = self.dbms.selectAllBook()
        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)

        return result



        


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























