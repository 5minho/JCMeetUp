from exceptions import EmptyQueueError


class MyQueue:

    def __init__(self):
        self.oldest_stack = []
        self.newest_stack = []

    def enq(self, item):
        self.newest_stack.append(item)

    def deq(self):
        self.update_oldest_if_needed()
        self.oldest_stack.pop()

    def peek(self):
        self.update_oldest_if_needed()
        try:
            return self.oldest_stack[-1]
        except IndexError:
            raise EmptyQueueError

    def is_empty(self):
        return False if self.oldest_stack else True

    def update_oldest_if_needed(self):
        if self.oldest_stack:
            return
        while self.newest_stack:
            self.oldest_stack.append(self.newest_stack.pop())
