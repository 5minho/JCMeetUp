class StackIsEmpty(Exception):
    def __str__(self):
        return "아이템이 없습니다."


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

    def push(self, stack, item):
        self.buffer.append((stack, item))

    def pop(self, stack):
        last_idx = self.get_last_idx_of(stack)
        self.buffer.pop(last_idx)

    def get_last_idx_of(self, stack):
        for i, item in enumerate(reversed(self.buffer)):
            if item[0] is stack:
                return len(self.buffer) - i - 1
        raise StackIsEmpty

    def peek(self):
        pass

    def is_empty(self):
        pass

