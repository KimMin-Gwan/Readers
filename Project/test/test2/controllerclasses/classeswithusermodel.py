# usermodel을 사용하는 클래스들

class ClassWithUserModel():

    def __init__(self, uid, id, pw, name, phonenumber, email):
        self.uid = uid
        self.id = id
        self.password = pw
        self.name = name
        self.phonenumber = phonenumber
        self.email = email

    def get_data_from_model(self, *arg):
        pass


class User(ClassWithUserModel):

    def getUid(self):
        return self.uid

    def setUid(self, new_uid):  # int
        self.uid = new_uid

    def getId(self):
        return self.id

    def setId(self, new_id):  # string
        self.id = new_id

    def getPassword(self):
        return self.password

    def setPassword(self, new_password):  # string
        self.password = new_password

    def getName(self):
        return self.name

    def setName(self, new_name):
        self.name = new_name

    def getPhoneNumber(self):
        return self.phonenumber

    def setPhoneNumber(self, new_phonenumber):  # string
        self.phonenumber = new_phonenumber

    def getEmail(self):
        return self.email

    def setEmail(self, new_Email):
        self.email = new_Email

    def setUser(self, new_uid, new_id, new_password, new_name, new_phonenumber, new_email):
        self.uid = new_uid
        self.id = new_id
        self.password = new_password
        self.name = new_name
        self.Phonenumber = new_phonenumber
        self.email = new_email

    def get_data_from_model(User, *arg):
        pass


class Register(ClassWithUserModel):

    def checkIdDuplication(self, new_id):
        id  # db.id 비교

    def storeId(self, new_id):

        self.id = new_id  # 입력받은 id를 db에 저장

    def storePassword(self, new_password):
        self.password = new_password  # db에 저장

    def storeName(self, new_name):
        self.name = new_name # db에 저장

    def storeEmail(self, new_email):
        self.email = new_email

    def storePhonenumber(self, new_phonenumber):
        self.phonenumber = new_phonenumber

    def storeUid(uid):
        uid


class Login(ClassWithUserModel):

    def __init__(self, id, password):

        self.id = id
        self.password = password

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

    def __init__(self, email, phonenumber):
        # self.input = input
        self.email = email
        self.phonenumber = phonenumber

    def findIdPassword(self):
        user
        if user is None:
            return None
        return user


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
