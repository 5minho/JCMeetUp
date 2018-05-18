import unittest
import random
from sort_stack import sort


class TestSortStack(unittest.TestCase):

    def setUp(self):
        self.stack = []

    def test_sort(self):
        test_stack = list(range(1, 10000))
        random.shuffle(test_stack)
        self.assertListEqual(list(range(9999, 0, -1)), sort(test_stack))


if __name__ == '__main__':
    unittest.main()

