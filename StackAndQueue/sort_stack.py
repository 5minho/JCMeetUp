
def sort(origin_stack):
    if not origin_stack:
        return []
    pivot = origin_stack.pop()

    if not origin_stack:
        return [pivot]

    lower_stack, upper_stack = [pivot], []

    while origin_stack:
        item = origin_stack.pop()
        if item <= pivot:
            lower_stack.append(item)
        else:
            upper_stack.append(item)

    return merge(sort(lower_stack), sort(upper_stack))


def merge(lower_stack, upper_stack):
    temp = []
    while lower_stack:
        temp.append(lower_stack.pop())
    while temp:
        upper_stack.append(temp.pop())
    return upper_stack
