
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






















