# main.py

import uvicorn
from controller import Master_Controller
from model import MasterModel
from view import AppServer

# 메인 함수
class Main_Function():
    def __init__(self):
        model = MasterModel()
        main_controller = Master_Controller(model)
        self.view = AppServer(main_controller)

    # 실행
    def run_app(self):
        self.view.run_server()

# 실행부
if __name__ == "__main__":
    main = Main_Function()
    main.run_app()
    