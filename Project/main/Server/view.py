from fastapi.responses import RedirectResponse, FileResponse
from fastapi import FastAPI, HTTPException, WebSocket
from pydantic import BaseModel
from starlette.middleware.cors import CORSMiddleware
from fastapi.websockets import WebSocketDisconnect
import base64  # for image transfer
import uvicorn

class AppServer():
    def __init__(self, controller):
        self.app = FastAPI()
        self.controller = controller

        self.app.add_middleware(
            CORSMiddleware,
            allow_origins=["*"],
            allow_credentials=True,
            allow_methods=["*"],
            allow_headers=["*"],
        )
        self.register_routes()

    def register_routes(self):

        @self.app.get('/')
        async def main_view(self):
            return {"message" : "Hello Readers"}
        

        # main_page list
        @self.app.get("/item/{item_id}")
        async def return_data(item_id : str):
            items = self.controller.get_item_data()
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
        

        
        @self.app.exception_handler(HTTPException)
        async def custom_exception_handler(request, exc):
            if exc.status_code == 403:
                raise HTTPException(status_code=403, detail="Page Not Found")
            return {"item":"Page Not Found"}
        
    def run_server(self):
        print("SYSTEM_CALL::STARTING SERVER")
        uvicorn.run(self.app, host="127.0.0.1", port=8000)

    

        







