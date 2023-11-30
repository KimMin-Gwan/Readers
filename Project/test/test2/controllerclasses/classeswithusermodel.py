# usermodel을 사용하는 클래스들
from fastapi import HTTPException

from Project.test.test2.model import UserModel


class ClassWithUserModel():
    def __init__(self):
        self.user_model = UserModel()

    def create_user(self, id, password, name, phoneNumber, email):
        return self.user_model.add_user(id, password, name, phoneNumber, email)

    def get_user(self, id):
        user = self.user_model.get_user(id)
        if not user:
            raise HTTPException(status_code=404, detail="User not found")
        return user

    def update_user(self, id, password, name, phoneNumber, email):
        self.user_model.update_user(id,password,name,phoneNumber,email)

    def delete_user(self, id):
        self.user_model.delete_user(id)

class User(ClassWithUserModel):

    def getUid(self):
        User.get_user(self,id)
        return User.get_user.uid

    def getId(self):
        User.get_user(self,id)
        return self.id

    def setId(self, new_id):  # string
        User.update_user(id=new_id)

    def getPassword(self):
        User.get_user(self,id)
        return self.password

    def setPassword(self, new_password):  # string
        User.update_user(password=new_password)
        self.password = new_password

    def getPhoneNumber(self):
        User.get_user(self,id)
        return self.phonenumber

    def setPhoneNumber(self, new_phonenumber):  # string
        User.update_user(phoneNumber=new_phonenumber)

    def getEmail(self):
        User.get_user(self,id)
        return self.email
    def setEmail(self, new_email):
        User.update_user(email=new_email)

    def setUser(self, new_id, new_password, new_phonenumber, new_email):
        User.update_user(id=new_id,password=new_password,phoneNumber=new_phonenumber,email=new_email)


class Register(ClassWithUserModel):

    def checkIdDuplication(self, new_id):

        data = User.get_user(id=new_id)
        print(data.id)
        return
    # db.id 비교

    def storeId(self,new_id):
        User.update_user(id=new_id)

    def storePassword(self, new_password):
        User.update_user(password=new_password)

    def storeEmail(self, new_email):
        User.update_user(email=new_email)

    def storePhonenumber(self, new_phoneNumber):
        User.update_user(phoneNumber=new_phoneNumber)


class Login(ClassWithUserModel):

    def getId(self):
        return self.id

    def getPassword(self):
        return self.password

    def checkLogin(self, id, password):
        if id == self.getId() and password == self.getPassword():
            return True
        else:
            return False


class Find(ClassWithUserModel):

    def findIdPassword(self):
        # user
        #if user is None:
        #    return None
        #return user
        pass


class Profile(ClassWithUserModel):

    def getId(self):
        return self.id

    def getPassword(self):
        return self.password

    def getName(self):
        return self.name

    def getId(self):
        return self.id

    def getPhonenumber(self):
        return self.phonenumber

    def getEmail(self):
        return self.email

    def storeId(self, new_id):
        self.id = new_id  # 입력받은 id를 db에 저장

    def storePassword(self, new_password):
        self.password = new_password  # db에 저장

    def storeName(self, new_name):
        self.name = new_name  # db에 저장

    def storeEmail(self, new_email):
        self.email = new_email

    def storePhonenumber(self, new_phonenumber):
        self.phonenumber = new_phonenumber

    def deleteUser(self):
        pass
