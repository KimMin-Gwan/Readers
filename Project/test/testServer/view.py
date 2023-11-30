from fastapi.responses import RedirectResponse, FileResponse
from fastapi import FastAPI, HTTPException, WebSocket
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import uvicorn
import json

#app = FastAPI()

#@app.get("/")
#def main():
    #return 'hello world'

#uvicorn.run(app, host="127.0.0.1", port=5000)


class AppServer():
    def __init__(self, controller = None):
        self.app = FastAPI()
        self.controller = controller

        self.app.add_middleware(
            CORSMiddleware, 
            allow_origins='*',
            allow_credentials=True,
            allow_methods=["*"],
            allow_headers=["*"],
        )

        self.register_routes()

    def register_routes(self):
        @self.app.get('/home')
        async def main_view():
            data = {"bid" : "212023",
                    "title" : "안녕 자두야",
                    "author" : "정혜원",
                    "genre" : "장르",
                    "publishedDate" : "2022년 01년 01일",
                    "sale" : "2000원"
                    }
            return_data = []
            return_data.append(data)
            return return_data

    def run_server(self):
        uvicorn.run(self.app, host="127.0.0.1", port=5000)

if __name__ == "__main__":
    app = AppServer()
    app.run_server()





