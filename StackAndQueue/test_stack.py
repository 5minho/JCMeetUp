import unittest
from stack import StackContainer, Stack


class TestThreeStackInStackContainer(unittest.TestCase):

    def setUp(self):
        self.container = StackContainer()
        self.s1 = Stack(container=self.container)
        self.s2 = Stack(container=self.container)
        self.s3 = Stack(container=self.container)

    def test_three_stack_push(self):
        self.s3.push(3)
        self.s1.push(3)
        self.s2.push(2)
        self.s1.push(4)
        self.s2.push(5)
        test_items = [3, 3, 2, 4, 5]
        for i, item in enumerate(test_items):
            self.assertEqual(item, self.container.buffer[i][1])


if __name__ == '__main__':
    unittest.main()
