import unittest
from stack import StackContainer

class TestStackContainer(unittest.TestCase):

    def __init__(self):
        self.container = None

    def setUp(self):
        self.container = StackContainer()


