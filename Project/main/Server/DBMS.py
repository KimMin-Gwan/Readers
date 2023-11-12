from constant import *
import cx_Oracle

# 상속해서 만들어도가능
# 의존성을 주입해서 사용해도 가능
# 기호에 따라 적절하게 선택하여 사용할것

class Databass():
    def __init__(self):
        self.connection = cx_Oracle.connect(username, password, dsn, encoding='UTF-8')


    def implement_query(self, query:str):
        # query = "select * from table"
        # 아래는 쿼리 실행문
        cursor = self.connection.cursor()
        cursor.execute(query) 

        data = self.call_cursor(cursor) # 사용가능한 데이터로 변경

        if len(data):
            return

        # self.work_something(cursor)  # 여기서 함수로 동작


    # 커서의 상태 및 현재 데이터 변환 후 반환
    def call_cursor(self, cursor):
        data = []
        print("Query Result")
        try:
            print("Data Type :", type(cursor))
            print("Data Len : ", len(cursor))
            print("Details")
            for i, row in enumerate(cursor):
                print(f"{i} : {row}")
                data.append(row) # 필요에 따라 형변환 후 append

        except Exception as e:
            print("Cursor did not work well")
            print(e)

        return data
       
    def terminate_connection(self):
        
        self.connection.close()
        
