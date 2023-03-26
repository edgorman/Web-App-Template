import celery


@app.task
def hello_world():
    print("hello world")
