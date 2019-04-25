# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)

# run rake db:seed

User.create(username: "acc17lm",  user_type:"Admin")
User.create(username: "aca17zsc", user_type:"Admin")
User.create(username: "aca17scf", user_type:"Admin")
User.create(username: "aca17mjs", user_type:"Admin")
User.create(username: "aca18mlj", user_type:"Admin")

User.create(username: "nr1jcd", user_type:"Admin")


Exam.find_or_create_by(date:'2019-03-27', exam_code:'EX0001', module_code:'COM1001', name:'Examination name 01', status:1)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX001',  module_code:'COM1001', name:'Examination name 1',  status: 0)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX002',  module_code:'COM1002', name:'Examination name 2',  status: 1)
Exam.find_or_create_by(date:'2019-3-21', exam_code:'EX003',  module_code:'COM1003', name:'Examination name 3',  status: 0)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX004',  module_code:'COM1002', name:'Examination name 4',  status: 0)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX005',  module_code:'COM1003', name:'Examination name 5',  status: 0)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX006',  module_code:'COM1001', name:'Examination name 6',  status: 0)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX007',  module_code:'COM1002', name:'Examination name 7',  status: 0)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX008',  module_code:'COM1003', name:'Examination name 8',  status: 0)
Exam.find_or_create_by(date:'2019-3-22', exam_code:'EX009',  module_code:'COM1003', name:'Examination name 9',  status: 1)
Exam.find_or_create_by(date:'2019-3-23', exam_code:'EX010',  module_code:'COM1002', name:'Examination name 10', status: 1)
Exam.find_or_create_by(date:'2019-3-24', exam_code:'EX011',  module_code:'COM1003', name:'Examination name 11', status: 0)
Exam.find_or_create_by(date:'2019-3-25', exam_code:'EX012',  module_code:'COM1002', name:'Examination name 12', status: 1)
Exam.find_or_create_by(date:'2019-3-26', exam_code:'EX013',  module_code:'COM1002', name:'Examination name 13', status: 0)
Exam.find_or_create_by(date:'2019-4-1',  exam_code:'EX0014', module_code:'COM1001', name:'Examination name 14', status: 0)
Exam.find_or_create_by(date:'2019-4-2',  exam_code:'EX0015', module_code:'COM1001', name:'Examination name 15', status: 0)
Exam.find_or_create_by(date:'2019-4-3',  exam_code:'EX0016', module_code:'COM1002', name:'Examination name 16', status: 0)
Exam.find_or_create_by(date:'2019-4-4',  exam_code:'EX0017', module_code:'COM1002', name:'Examination name 17', status: 0)
Exam.find_or_create_by(date:'2019-4-10', exam_code:'EX0018', module_code:'COM1001', name:'Examination name 18', status: 0)
Exam.find_or_create_by(date:'2019-4-11', exam_code:'EX0019', module_code:'COM1003', name:'Examination name 19', status: 1)
Exam.find_or_create_by(date:'2019-3-20', exam_code:'EX0020', module_code:'COM1001', name:'Examination name 20', status: 0)
Exam.find_or_create_by(date:'2019-4-20', exam_code:'EX0021', module_code:'COM1002', name:'Examination name 21', status: 0)
Exam.find_or_create_by(date:'2019-4-21', exam_code:'EX0022', module_code:'COM1003', name:'Examination name 22', status: 0)
Exam.find_or_create_by(date:'2019-4-25', exam_code:'EX0023', module_code:'COM1002', name:'Examination name 23', status: 0)
Exam.find_or_create_by(date:'2019-4-26', exam_code:'EX0024', module_code:'COM1001', name:'Examination name 24', status: 1)
Exam.find_or_create_by(date:'2019-4-27', exam_code:'EX0025', module_code:'COM1002', name:'Examination name 25', status: 0)
Exam.find_or_create_by(date:'2019-4-28', exam_code:'EX0026', module_code:'COM1003', name:'Examination name 26', status: 0)
Exam.find_or_create_by(date:'2019-4-29', exam_code:'EX0027', module_code:'COM1002', name:'Examination name 27', status: 0)
Exam.find_or_create_by(date:'2019-5-1',  exam_code:'EX0028', module_code:'COM1003', name:'Examination name 28', status: 0)
Exam.find_or_create_by(date:'2019-5-2',  exam_code:'EX0029', module_code:'COM1002', name:'Examination name 29', status: 0)

Station.find_or_create_by(station_name: 'Station 1', pass_mark: 3, exam_id: 'EX001')
Answer.find_or_create_by(text: 'Fully met',     score: 2, station_id: 1)
Answer.find_or_create_by(text: 'Partially met', score: 1, station_id: 1)
Answer.find_or_create_by(text: 'Not met',       score: 0, station_id: 1)
Criterium.find_or_create_by(number: 1, criteria_description: "Example criteria 1", criteria_critical: false, station_id: 1)
Criterium.find_or_create_by(number: 2, criteria_description: "Example criteria 2", criteria_critical: false, station_id: 1)
Criterium.find_or_create_by(number: 3, criteria_description: "Example criteria 3", criteria_critical: true, station_id: 1)
Criterium.find_or_create_by(number: 4, criteria_description: "Example criteria 4", criteria_critical: false, station_id: 1)

Station.find_or_create_by(station_name: 'Station 2', pass_mark: 1, exam_id: 'EX001')
Answer.find_or_create_by(text: 'Fully met',     score: 2, station_id: 2)
Answer.find_or_create_by(text: 'Partially met', score: 1, station_id: 2)
Answer.find_or_create_by(text: 'Not met',       score: 0, station_id: 2)
Criterium.find_or_create_by(number: 2, criteria_description: "Example criteria 5", criteria_critical: false, station_id: 2)
Criterium.find_or_create_by(number: 1, criteria_description: "Example criteria 6", criteria_critical: false, station_id: 2)


Station.find_or_create_by(station_name: 'Station 1 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 2 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 3 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 4 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 5 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 6 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 7 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 8 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 9 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 10 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 11 examination name 01', pass_mark: 70, exam_id:'EX0001')
Station.find_or_create_by(station_name: 'Station 12 examination name 01', pass_mark: 70, exam_id:'EX0001')
