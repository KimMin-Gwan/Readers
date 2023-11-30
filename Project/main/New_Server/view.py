from fastapi.responses import RedirectResponse, FileResponse
from fastapi import FastAPI, HTTPException, WebSocket
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import uvicorn
import json
#------------------------------------
from controller import Master_Controller

class AppServer():
    def __init__(self, controller = None):
        self.app = FastAPI()
        self.controller:Master_Controller = controller


        self.app.add_middleware(
            CORSMiddleware, 
            allow_origins='*',
            allow_credentials=True,
            allow_methods=["*"],
            allow_headers=["*"],
        )
        
        # 메인 라우터 실행
        self.register_routes()
        
    def register_routes(self):
        
        # http://127.0.0.1:8000/homePage
        # 메인 페이지 데이터 전송
        @self.app.get('/homePage')
        async def getHomePage():
            result = self.controller.get_book_data("mainPage") #dict
            return result
        
        # 도서 상세정보 데이터 전송
        @self.app.get('/homePage/{bid}')
        async def getBookDetailPage():
            result = self.controller.get_book_data("detail") #dict
            return result
        
        # login
        @self.app.post('/login')
        async def login(id: str, pw: str):
            result = self.controller.get_user_data(id, pw)
            return result

    def run_server(self):
        uvicorn.run(self.app, host="127.0.0.1", port = 8000)

    




#if __name__ == "__main__":
    #app = AppServer()
    #app.run_server()
