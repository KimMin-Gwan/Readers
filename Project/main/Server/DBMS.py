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
        
        try: 
            cursor = self.connection.cursor()
            cursor.execute(query, (id, password, name, phoneNumber, email))
            cursor.close()
        except Exception as e:
            return
        
    def updateUser(self, id:str, password:str, name:str, phoneNumber:str, email:str):
        query = "update user set password = %s, name %s, phoneNumber = %s, email = %s where id = %s"
        
        try: 
            cursor = self.connection.cursor()
            cursor.execute(query(password, name, phoneNumber, email, id))
            cursor.close()
        except Exception as e:
            return    
        
    def deleteUser(self, id:str):
        query = "delete from user where id = %s"

        try: 
            cursor = self.connection.cursor()
            cursor.execute(query(id))
            cursor.close()
        except Exception as e:
            return
        
    def selectBook(self, bid:str):
        query = "select * from book where bid = %s"

        cursor = self.connection.cursor()
        cursor.execute(query(bid))
        
        data = self.call_cursor(cursor)
        
        cursor.close()
        
        if not len(data):
            return

        result = self.work_something(data)

        return result
          
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
        
    def selectReview(self, bid:str, writer:str):
        query = "select * from review where bid = %s and writer = %s"

        cursor = self.connection.cursor()
        cursor.execute(query(bid, writer))
        
        data = self.call_cursor(cursor)
        
        cursor.close()
        
        if not len(data):
            return

        result = self.work_something(data)

        return result 
        
    def insertReview(self, bid:str, writer:str, contents:str):
        query = "insert into review (bid, writer, likes, contents, date) values (%s, %s, 0, %s, now())"

        try: 
            cursor = self.connection.cursor()
            cursor.execute(query(bid, writer, contents))
            cursor.close()
        except Exception as e:
            return
        
    def updateReview(self, bid:str, writer:str, likes:int, contents:str):
        query = "update review set likes = %d, contents = %s, date = now() where bid = %s and writer = %s"

        try: 
            cursor = self.connection.cursor()
            cursor.execute(query(likes, contents, bid, writer))
            cursor.close()
        except Exception as e:
            return
        
    def deleteReview(self, bid:str, writer:str):
        query = "delete from user where bid = %s and writer = %s"

        try: 
            cursor = self.connection.cursor()
            cursor.execute(query(bid, writer))
            cursor.close()
        except Exception as e:
            return
        
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
    
    def dataToUserList(self, data):
        for i in data:
            result = i
            
        return result
            
       
    def terminate_connection(self):
        self.connection.close()


