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
        
        data = cursor.fetchall()        
        cursor.close()
        
        if not len(data):
            return
        
        result = self.dataToUser(data)

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
        
        data = cursor.fetchall()
        cursor.close()
        
        if not len(data):
            return

        result = self.dataToBook(data)

        return result
     
    def selectBookByTitle(self, title:str):
        query = "select * from book where title like concat('%', %s, '%')"

        cursor = self.connection.cursor()
        cursor.execute(query(title))
        
        data = cursor.fetchall()        
        cursor.close()
        
        if not len(data):
            return

        result = self.dataToBookList(data)

        return result
    
    def selectBookByGenre(self, genre:str):
        query = "select * from book where genre like concat('%', %s, '%')"

        cursor = self.connection.cursor()
        cursor.execute(query(genre))
        
        data = cursor.fetchall()        
        cursor.close()
        
        if not len(data):
            return

        result = self.dataToBookList(data)

        return result
    
    def selectBookByTitle(self, title:str):
        query = "select * from book where title like concat('%', %s, '%')"

        cursor = self.connection.cursor()
        cursor.execute(query(title))
        
        data = cursor.fetchall()        
        cursor.close()
        
        if not len(data):
            return

        result = self.dataToBookList(data)

        return result
           
    def selectAllBook(self):
        query = "select * from book"

        cursor = self.connection.cursor()
        cursor.execute(query)
        
        data = cursor.fetchall()        
        cursor.close()
        
        if not len(data):
            return

        result = self.dataToBookList(data)

        return result
        
    def selectReview(self, bid:str, writer:str):
        query = "select * from review where bid = %s and writer = %s"

        cursor = self.connection.cursor()
        cursor.execute(query(bid, writer))
        
        data = cursor.fetchall()
        cursor.close()
        
        if not len(data):
            return

        result = self.dataToReview(data)

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
        
        data = cursor.fetchall()
        cursor.close()
        
        if not len(data):
            return

        result = self.dataToReviewList(data)

        return result

    def selectReviewByTitle(self, title:str):
            query = "select * from review where bid = (select bid from book where title like concat('%', %s, '%'))"

            cursor = self.connection.cursor()
            cursor.execute(query(title))
            
            data = cursor.fetchall()        
            cursor.close()
            
            if not len(data):
                return

            result = self.dataToReviewList(data)

            return result
    
    # 커서의 상태 출력
    def call_cursor(self, cursor):
        print("Query Result")
        try:
            print("Data Type :", type(cursor))
            print("Data Len : ", len(cursor))
            print("Details")
            for i, row in enumerate(cursor):
                print(f"{i} : {row}")

        except Exception as e:
            print("Cursor did not work well")
            print(e)

        return
    
    # data -> class 변환
    def dataToUserList(self, datas):
        userList = []
        
        for data in datas:
            user = User(data[0], data[1], data[2], data[3], data[4], data[5])
            userList.append(user)
            
        return userList
    
    def dataToUser(self, data):
        return User(data[0], data[1], data[2], data[3], data[4], data[5])
        
    def dataToBookList(self, datas):
        bookList = []
        
        for data in datas:
            book = Book(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9])
            bookList.append(book)
            
        return bookList
    
    def dataToBook(self, data):
        return Book(data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9])
            
    def dataToReviewList(self, datas):
       reviewList = []
       
       for data in datas:
           review = Review(data[0], data[1], data[2], data[3], data[4])
           reviewList.append(review)
           
       return reviewList
    
    def dataToReview(self, data):
        return Review(data[0], data[1], data[2], data[3], data[4])
        
    def terminate_connection(self):
        self.connection.close()


