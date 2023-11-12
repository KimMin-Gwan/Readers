# controller.py

# controller에 작성된 내용이 너무 많다면 패키지로 변경할것


# 의존성으로 연결
class Master_Controller():
    def __init__(self, model):
        self.cover_search = Cover_Search_Controller()
        self.book_detail = BookDetailView()
        self.model = model


# 베이스 클래스
# 아래에서 상속하여 구현하길 권장
# 상속이 어렵다면 그냥 구현
class ClassWithModel():
    def __init__(self, db):
        self.db = db

    def get_data_from_mddel(self, *arg):
        pass


class BookDetailView(ClassWithModel):
    def __init__(self):
        pass


class Cover_Search_Controller(ClassWithModel):
    def __init__(self):
        pass

