
class Stack:
    def __init__(self, container):
        self.container = container
        self.last_idx_table = {}

    def push(self, item):
        self.container.push(self, item)

    def pop(self):
        self.container.pop(self)

    def peek(self):
        self.container.peek(self)

    def is_empty(self):
        self.container.is_empty(self)


class StackContainer:

    def __init__(self):
        self.buffer = []
        self.last_idx_table = {}

    def push(self, stack, item):
        self.buffer.append((stack, item))
        self.last_idx_table[stack] = len(self.buffer)

    def pop(self, stack):
        last_idx = self.last_idx_table[stack]
        self.buffer.pop(last_idx)

    def peek(self):
        pass

    def is_empty(self):
        pass

