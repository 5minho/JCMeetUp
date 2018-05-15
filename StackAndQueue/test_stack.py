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

        for stack_and_item in test_stack_and_items:
            stack = stack_and_item[0]
            item = stack_and_item[1]
            stack.push(item)

        for i, stack_and_item in enumerate(self.container.buffer):
            expected_stack = test_stack_and_items[i][0]
            expected_item = test_stack_and_items[i][1]
            stack = stack_and_item[0]
            item = stack_and_item[1]
            self.assertEqual(expected_stack, stack)
            self.assertEqual(expected_item, item)


if __name__ == '__main__':
    unittest.main()
