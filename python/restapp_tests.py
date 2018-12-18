import unittest
import restapp
import json

class testRestMethods(unittest.TestCase):

	def setUp(self):
		restapp.app.testing = True
		self.app = restapp.app.test_client()

	def testGet(self):
		rv = self.app.get('/todo/api/v1.0/tasks')
		json_data = json.loads(rv.data)
		print json_data

	def testPost(self):
		rv = self.app.post('/todo/api/v1.0/tasks/3')

	def testDelete(self):
		rv = self.app.delete('/todo/api/v1.0/tasks/1')


if __name__ == '__main__':
    unittest.main()