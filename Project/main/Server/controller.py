

class Master_Controller():
    def __init__(self):
        self.cover_search = Cover_Search_Controller()
        self.book_detail = BookDetailView()


class ClassWithDatabase():
    def __init__(self, db):
        self.db = db
    

    def get_data_from_db(self, *arg):
        pass
        



class BookDetailView(ClassWithDatabase):
    def __init__(self):
        pass
    

class Cover_Search_Controller(ClassWithDatabase):
    def __init__(self):
        pass

