import unittest
from my_queue_by_two_stacks import MyQueue


class TestMyQueue(unittest.TestCase):

    def setUp(self):
        self.q = MyQueue()

    def test_assert_newest_stack_always_have_new_items_whenever_enq(self):
        self.q.enq(2)
        self.assertEqual(2, self.q.newest_stack[-1])
        self.q.enq(3)
        self.assertEqual(3, self.q.newest_stack[-1])

    def test_assert_oldest_stack_always_have_old_items_whenever_deq_or_peek(self):
        self.q.enq(4)
        self.q.enq(6)
        self.q.enq(2)
        self.assertFalse(self.q.oldest_stack)
        self.assertTrue(4, self.q.deq())
        self.assertTrue(6, self.q.peek())
        self.assertTrue(6, self.q.deq())
        self.assertTrue(2, self.q.deq())
        self.assertTrue(self.q.is_empty())


if __name__ == '__main__':
    unittest.main()
