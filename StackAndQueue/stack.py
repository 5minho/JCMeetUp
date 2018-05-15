
class Stack:
    def __init__(self, container):
        self.container = container
        self.last_idx_table = {}

    def push(self, item):
        self.container.push(self, item)

    def pop(self):
        self.container.pop(self)


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