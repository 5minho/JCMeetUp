class EmptyQueueError(Exception):
    def __str__(self):
        return '큐가 비었습니다.'
