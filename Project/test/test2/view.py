# View.py

from fastapi.responses import RedirectResponse, FileResponse
from fastapi import FastAPI, HTTPException, WebSocket
from pydantic import BaseModel
from starlette.middleware.cors import CORSMiddleware
from fastapi.websockets import WebSocketDisconnect
import base64  # for image transfer
import uvicorn

from typing import List

import requests
import json


# dict

#front (flutter) JSON DICT
#result = requests.post("http://127.0.0.1/home")
#result = {'author' : "hello world", 'genre' : "hello_world"}
#json_data = json.dump(result)
#print(json_data)

# View Part
class AppServer():
    def __init__(self, controller):
        self.app = FastAPI()
        self.controller = controller

        
        # middle ware accept
        self.app.add_middleware(
            CORSMiddleware,
            allow_origins=["*"],
            allow_credentials=True,
            allow_methods=["*"],
            allow_headers=["*"],
        )
        # 엔드 포인트 router 실행
        self.register_routes()


    # 엔드 포인트
    def register_routes(self):
        # root
        @self.app.get('/home')
        async def main_view(self):
            return {"message" : "Hello Readers"}

        # main_page list
        class Book(BaseModel):
            bid: str
            title: str
            author: str
            genre: str
            publishedDate: str
            sale: int

        @self.app.get("/item/main/{book_id}", response_model=List[Book])
        async def main_booklist(book_id : str):
            book = Book(
                bid = book_id,
                title = self.controller.getTitle(),
                author = self.controller.getAuthor(),
                genre = self.controller.getGenre(),
                publishedDate = self.controller.getPublishedDate(),
                sale = self.controller.getSale()
            )
            return [book]
        
        # book list(date order)
        @self.app.get("/item/book/{item_id}")
        async def return_data(item_id : str):
            items = self.controller.get_book_list_data()  # book_list 
            if item_id not in items:
                raise HTTPException(status_code=404, detail="Item not Found")
            return {"item":items[item_id]}
        
        # book store list
        class Store(Book):
            lowest_shop: str
            lowest_price: int

        @self.app.get("/item/main/{book_id}", response_model=List[Store])
        async def storelist(book_id : str):
            store = Store(
                bid = book_id,
                title = self.controller.getTitle(),
                author = self.controller.getAuthor(),
                genre = self.controller.getGenre(),
                publishedDate = self.controller.getPublishedDate(),
                sale = self.controller.getSale(),
                #shop = lowest_shop,
                #price = lowest_price
            )
            return [store]
        

        # Exception_Handle (page fault)
        @self.app.exception_handler(HTTPException)
        async def custom_exception_handler(request, exc):
            if exc.status_code == 403:
                raise HTTPException(status_code=403, detail="Page Not Found")
            return {"item":"Page Not Found"}
        
        # login
        class LoginData(BaseModel):
            ID: str
            PW : str

        @self.app.post("/login")
        async def login(data: LoginData):
            login = self.controller.Login(data.ID, data.PW)
            if login.checkLogin(data.ID, data.PW):
                return {"result" : "true"}
            else:
                raise HTTPException(status_code=401, detail="Login Failed")
        
        # register
        class RegisterData(BaseModel):
            ID: str
            PW: str
            name: str
            phoneNumber: str
            email: str

        @self.app.post("/register")
        async def register(data: RegisterData):
            if self.controller.checkIdDuplication(data.ID):
                return {"result" : "false", "detail" : "100"}
            self.controller.storeId(data.ID)
            self.controller.storePassword(data.PW)
            self.controller.storeName(data.name)
            self.controller.storeEmail(data.email)
            self.controller.storePhonenumber(data.phoneNumber)
            # uid 할당방법?
            #self.controller.storeUid(data.uid)
            return {"return" : "true"}
            # detail?
        
        # find
        class FindData(BaseModel):
            ID: str
            email: str

        @self.app.post("/find")
        async def find(data: FindData):
            find = self.controller.Find(data.ID, data.email)
            user = find.findIdPassword()
            if user is None:
                return {"result" : "false", "detail": "Not_Found"}
            return {"id": find.id, "password": find.password}
            # detail?

        # change_pw
        class NewPasswordData(LoginData):
            newPassword: str

        @self.app.post("/change_pw")
        async def change_pw(data: NewPasswordData):
            if self.controller.checkLogin(data.ID, data.PW):
                self.controller.setPassword(data.newPassword)
            else:
                {"result" : "false", "detail" : "Not_Found"}

        # bookdetail
        class BookBidData(BaseModel):
            bid: str

        class BookDetailData(Book):
            content: str
            introduction: str

        @self.app.post("/bookdetail", response_model = List[BookDetailData])
        async def bookdetail(data: BookDetailData):
            #if data.bid == self.controller.getBid()?
            book = BookDetailData(
                bid = data.bid,
                title = self.controller.getTitle(),
                author = self.controller.getAuthor(),
                genre = self.controller.getGenre(),
                publishedDate = self.controller.getPublishedDate(),
                sale = self.controller.getSale(),
                content = self.controller.getContent(),
                introduction = self.controller.getIntroduction()
            )
            return [book]

    # 동작
    def run_server(self):
        print("SYSTEM_CALL::STARTING SERVER")
        uvicorn.run(self.app, host="127.0.0.1", port=8000)

    

        # ws  apache, nginx
# http://127.0.0.1:8000/ localhost
# http://192.168.245.1:8000/

