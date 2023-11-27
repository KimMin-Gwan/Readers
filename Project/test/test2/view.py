# View.py

from fastapi.responses import RedirectResponse, FileResponse
from fastapi import FastAPI, HTTPException, WebSocket
from pydantic import BaseModel
from starlette.middleware.cors import CORSMiddleware
from fastapi.websockets import WebSocketDisconnect
import base64  # for image transfer
import uvicorn

from controller import Login, Register, Find

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
        @self.app.get("/item/main/{item_id}")
        async def return_data(item_id : str):
            items = self.controller.get_item_data(item_id)
            if item_id not in items:
                raise HTTPException(status_code=404, detail="Item not Found")
            return {"item":items[item_id]}
        
        # book list
        @self.app.get("/item/book/{item_id}")
        async def return_data(item_id : str):
            items = self.controller.get_book_list_data()  # book_list 
            if item_id not in items:
                raise HTTPException(status_code=404, detail="Item not Found")
            return {"item":items[item_id]}
        

        # Exception_Handle (page fault)
        @self.app.exception_handler(HTTPException)
        async def custom_exception_handler(request, exc):
            if exc.status_code == 403:
                raise HTTPException(status_code=403, detail="Page Not Found")
            return {"item":"Page Not Found"}
        
        # login
        @self.app.post("/login")
        async def login(id: str, password: str):
            login = Login(id, password)
            if login.checkLogin(id, password):
                return {"message" : "Login Success"}
            else:
                raise HTTPException(status_code=401, detail="Login Failed")
        
        # register
        @self.app.post("/register")
        async def register(new_id: str, new_password: str, new_name: str, 
                           new_email: str, new_phonenumber: str, new_uid: int):
            if Register.checkIdDuplication(new_id):
                raise HTTPException(status_code=409, detail="ID already exists")
            self.controller.storeId(new_id)
            Register.storeId(new_id)
            Register.storePassword(new_password)
            Register.storeName(new_name)
            Register.storeEmail(new_email)
            Register.storePhonenumber(new_phonenumber)
            # uid 할당방법?
            Register.storeUid(new_uid)
            return {"message" : "Register Success"}
        
        # find
        @self.app.post("/find")
        async def find(email: str, phonenumber: str):
            find = Find(email, phonenumber)
            user = find.findIdPassword()
            if user is None:
                raise HTTPException(status_code=404, detail="User not Found")
            return {"id": find.id, "password": find.password}

    # 동작
    def run_server(self):
        print("SYSTEM_CALL::STARTING SERVER")
        uvicorn.run(self.app, host="127.0.0.1", port=8000)

    

        # ws  apache, nginx
# http://127.0.0.1:8000/ localhost
# http://192.168.245.1:8000/

