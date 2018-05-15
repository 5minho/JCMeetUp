import unittest
from three_stack_in_one_array import StackContainer, Stack


class TestThreeStackInOneArray(unittest.TestCase):

    def setUp(self):
        self.container = StackContainer()
        self.s1 = Stack(container=self.container)
        self.s2 = Stack(container=self.container)
        self.s3 = Stack(container=self.container)

    def test_push(self):
        test_stack_and_items = [(self.s3, 3),
                                (self.s1, 3),
                                (self.s2, 2),
                                (self.s1, 4),
                                (self.s2, 4),
                                (self.s1, 5)]
        self.push_items(test_stack_and_items)
        self.assertListEqual(test_stack_and_items, self.container.container)

    def test_pop(self):
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

        self.assertListEqual(expected_values, self.container.container)

    def test_peek(self):
        self.s1.push(1)
        self.s1.push(2)
        self.s1.push(3)
        self.assertEqual(self.s1.peek(), 3)
        self.s1.pop()
        self.assertEqual(self.s1.peek(), 2)
        self.s2.push(4)
        self.s3.push(5)
        self.assertEqual(self.s2.peek(), 4)
        self.s1.push(6)
        self.assertEqual(self.s3.peek(), 5)
        self.assertEqual(self.s1.peek(), 6)

    def test_is_empty(self):
        self.assertTrue(self.s1.is_empty())
        self.assertTrue(self.s2.is_empty())
        self.assertTrue(self.s3.is_empty())
        self.s1.push(2)
        self.assertFalse(self.s1.is_empty())
        self.s2.push(2)
        self.s2.push(4)
        self.s3.push(6)
        self.s2.pop()
        self.s1.pop()
        self.assertTrue(self.s1.is_empty())
        self.s3.pop()
        self.assertTrue(self.s3.is_empty())
        self.s2.pop()
        self.assertTrue(self.s2.is_empty())

    def push_items(self, test_values):
        for stack_and_item in test_values:
            stack = stack_and_item[0]
            item = stack_and_item[1]
            stack.push(item)


if __name__ == '__main__':
    unittest.main()
