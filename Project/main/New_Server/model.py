
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
    
    # 특정 책 상세정보 호출
    def get_book(self, bid):
        try:
            result = self.dbms.selectBook(bid)
        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)

        return result
    
    def find_valid_id(self, id):
        try:
            result = self.dbms.selectUser(id)
            if result != None:
                result = result["id"]
        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)
        
        return result
    
    def find_pw(self, id):
        try:
            result = self.dbms.selectUser(id)
            if result != None:
                pw_result = result["pw"]
                uid_result = result["uid"]

        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)

        return pw_result, uid_result
    
    # 회원가입
    def insertUser(self, uid, id, pw, name, phone, email):
        try:
            result = self.dbms.insertUser(uid, id, pw, name, phone, email)

        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)

        return result
    
    # 아이디 찾기
    def get_id(self, name, email):
        # name, email -> id?
        try:
            result = self.dbms.selectUser(id)
            if result != None:
                result = result["id"]

        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)

    # 비밀번호 찾기
    def get_pw(self, id, name, email):
        # name, email?
        try:
            result = self.dbms.selectUser(id)
            if result != None:
                result = result["pw"]

        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)
    
    # 특정 도서 리뷰리스트
    def get_review_list(self, bid):
        result = []
        try:
            # List<Review>
            result = self.dbms.selectReview(bid)
        except Exception as e:
            print("ERROR || Can't get data from db")
            print(e)

        return result



















