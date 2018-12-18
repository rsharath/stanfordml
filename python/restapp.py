#!flask/bin/python
from flask import Flask, jsonify, abort, make_response, request

app = Flask(__name__)

# json object for getting tasks
tasks = [
	{
		'id':1,
		'title':u'py code',
		'description':u'Python Code Mastery!',
		'done':False
	},
	{
		'id':2,
		'title':u'Do work stuff',
		'description':u'complete regular 9-5 works stuff!',
		'done':False
	}
	]

# get all tasks operation
@app.route('/todo/api/v1.0/tasks',methods=['GET'])
def get_tasks():
	return jsonify({'tasks':tasks})

# get specific task based on id
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['GET'])
def get_task(task_id):
	task = [task for task in tasks if task['id'] == task_id]
	if len(task) == 0:
		abort(404)
	return jsonify({'task':task[0]})

# add a task using post
@app.route('/todo/api/v1.0/tasks',methods=['POST'])
def create_task():
	if not request.json or not 'title' in request.json:
		abort(404)

	task = {
		'id':tasks[-1]['id']+1,
		'title':request.json['title'],
		'description':request.json.get('description',""),
		'done':False
		}

	tasks.append(task)
	return jsonify({'task':task}),201

# delete a task based on id
@app.route('/todo/api/v1.0/tasks/<int:task_id>',methods=['DELETE'])
def delete_task(task_id):
	task = [task for task in tasks if task['id'] == task_id]
	if len(task) == 0:
		abort(404)
	tasks.remove(task[0])
#	return jsonify({'result',True})
	return jsonify(task)

# 404 handler
@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)

if (__name__) == '__main__':
	app.run(debug=True)

