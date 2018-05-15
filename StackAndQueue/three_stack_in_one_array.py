class StackIsEmpty(Exception):
    def __str__(self):
        return "아이템이 없습니다."


class Stack:
    def __init__(self, container):
        self.container = container
        
    def push(self, item):
        self.container.push(self, item)

    def pop(self):
        self.container.pop(self)

    def peek(self):
        return self.container.peek(self)

    def is_empty(self):
        return self.container.is_empty(self)


class StackContainer:

    def __init__(self):
        self.container = []

    def push(self, stack, item):
        self.container.append((stack, item))

    def pop(self, stack):
        last_idx = self.get_last_idx_of(stack)
        self.container.pop(last_idx)

    def get_last_idx_of(self, stack):
        for i, item in enumerate(reversed(self.container)):
            if item[0] is stack:
                return len(self.container) - i - 1
        raise StackIsEmpty

    def peek(self, stack):
        last_idx = self.get_last_idx_of(stack)
        return self.container[last_idx][1]

    def is_empty(self, stack):
        try:
            _ = self.get_last_idx_of(stack)
        except StackIsEmpty:
            return True
        else:
            return False


