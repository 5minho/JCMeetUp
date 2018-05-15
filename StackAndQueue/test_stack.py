import unittest
from stack import StackContainer, Stack


class TestThreeStackInStackContainer(unittest.TestCase):

    def setUp(self):
        self.container = StackContainer()
        self.s1 = Stack(container=self.container)
        self.s2 = Stack(container=self.container)
        self.s3 = Stack(container=self.container)

    def test_three_stack_push(self):
        test_stack_and_items = [(self.s3, 3),
                                (self.s1, 3),
                                (self.s2, 2),
                                (self.s1, 4),
                                (self.s2, 4),
                                (self.s1, 5)]
        self.push_items(test_stack_and_items)
        self.assertListEqual(test_stack_and_items, self.container.buffer)

    def test_three_stack_pop(self):
        test_stack_and_items = [(self.s3, 3),
                                (self.s1, 3),
                                (self.s2, 2),
                                (self.s1, 4),
                                (self.s2, 4),
                                (self.s1, 5)]
        self.push_items(test_stack_and_items)

        self.s1.pop()
        self.s1.pop()
        self.s2.pop()
        self.s3.pop()

        expected_values = [
            (self.s1, 3),
            (self.s2, 2)
        ]

        self.assertListEqual(expected_values, self.container.buffer)

    def push_items(self, test_values):
        for stack_and_item in test_values:
            stack = stack_and_item[0]
            item = stack_and_item[1]
            stack.push(item)


if __name__ == '__main__':
    unittest.main()
