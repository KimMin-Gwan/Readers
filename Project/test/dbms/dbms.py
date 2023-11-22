# DBMS.py

from constant import *
import pymysql

# 상속해서 만들어도가능
# 의존성을 주입해서 사용해도 가능
# 기호에 따라 적절하게 선택하여 사용할것


# DBMS
class Database():
    def __init__(self):
        self.connection = pymysql.connect(host='3.37.23.159', user='root', password='0000', db='readers', encoding='UTF-8')

    # Query 실행부
    def selectAll(self, query:str):
        query = "sellect *"
        # 아래는 쿼리 실행문
        cursor = self.connection.cursor()
        cursor.execute(query) 

        data = self.call_cursor(cursor) # 사용가능한 데이터로 변경

        cursor.close()
        # 만약 찾아낸 데이터가 없다면 처리
        if not len(data):
            return

        result = self.work_something(data)  # 여기서 함수로 동작

        return result


    def selectUser(self, id:str):
        query = "select * from user where id = %s"

        cursor = self.connection.cursor()
        cursor.execute(query, (id))
        
        data = self.call_cursor(cursor)
        
        cursor.close()
        
        if not len(data):
            return

        result = self.work_something(data)

        return result
        
        
    def insertUser(self, id:str, password:str, name:str, phoneNumber:str, email:str):
        query = "insert into user (id, password, name, phoneNumber, email) values (%s, %s, %s, %s, %s)"
        
        cursor = self.connection.cursor()
        cursor.execute(query, (id, password, name, phoneNumber, email))
        
        cursor.close()
        
        return
        
    def updateUser():
        
    def deleteUser():
        
    def selectBook():
    
    def insertBook():
    
    def updateBook():
    
    def deleteBook():
        
    def selectAllBook(self):
        query = "select * from book"

        cursor = self.connection.cursor()
        cursor.execute(query)
        
        data = self.call_cursor(cursor)
        
        cursor.close()
        
        if not len(data):
            return

        result = self.work_something(data)

        return result
        
    def selectReview():
        
    def insertReview():
        
    def updateReview():
        
    def deleteReview():
        
    def selectAllReview(self):
        query = "select * from review"

        cursor = self.connection.cursor()
        cursor.execute(query)
        
        data = self.call_cursor(cursor)
        
        cursor.close()
        
        if not len(data):
            return

        result = self.work_something(data)

        return result

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


