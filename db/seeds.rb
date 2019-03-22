# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# run rake db:seed

UniModule.create(module_code:'COM1001',module_name:'Computer Science 1')
UniModule.create(module_code:'COM1002',module_name:'Computer Science 2')
UniModule.create(module_code:'COM1003',module_name:'Computer Science 3')

Exam.create(date:'2019-3-22', exam_code:'EX001',module_code:'COM1001',name:'Examination name 1')
Exam.create(date:'2019-3-22', exam_code:'EX002',module_code:'COM1002',name:'Examination name 2')
Exam.create(date:'2019-3-22', exam_code:'EX003',module_code:'COM1003',name:'Examination name 3')
Exam.create(date:'2019-3-22', exam_code:'EX004',module_code:'COM1002',name:'Examination name 4')
Exam.create(date:'2019-3-22', exam_code:'EX005',module_code:'COM1003',name:'Examination name 5')
Exam.create(date:'2019-3-22', exam_code:'EX006',module_code:'COM1001',name:'Examination name 6')
Exam.create(date:'2019-3-22', exam_code:'EX007',module_code:'COM1002',name:'Examination name 7')
Exam.create(date:'2019-3-22', exam_code:'EX008',module_code:'COM1003',name:'Examination name 8')
Exam.create(date:'2019-3-22', exam_code:'EX009',module_code:'COM1003',name:'Examination name 9')
Exam.create(date:'2019-3-22', exam_code:'EX010',module_code:'COM1002',name:'Examination name 10')
Exam.create(date:'2019-3-22', exam_code:'EX011',module_code:'COM1003',name:'Examination name 11')
Exam.create(date:'2019-3-22', exam_code:'EX012',module_code:'COM1002',name:'Examination name 12')
Exam.create(date:'2019-3-26', exam_code:'EX013',module_code:'COM1002',name:'Examination name 13')
Exam.create(date:'2019-4-1', exam_code:'EX0014',module_code:'COM1001',name:'Examination name 14')
Exam.create(date:'2019-4-2', exam_code:'EX0015',module_code:'COM1001',name:'Examination name 15')
Exam.create(date:'2019-4-3', exam_code:'EX0016',module_code:'COM1002',name:'Examination name 16')
Exam.create(date:'2019-4-4', exam_code:'EX0017',module_code:'COM1002',name:'Examination name 17')
Exam.create(date:'2019-4-10', exam_code:'EX0018',module_code:'COM1001',name:'Examination name 18')
Exam.create(date:'2019-4-11', exam_code:'EX0019',module_code:'COM1003',name:'Examination name 19')
Exam.create(date:'2019-3-20', exam_code:'EX0020',module_code:'COM1001',name:'Examination name 20')
Exam.create(date:'2019-4-20', exam_code:'EX0021',module_code:'COM1002',name:'Examination name 21')
Exam.create(date:'2019-4-21', exam_code:'EX0022',module_code:'COM1003',name:'Examination name 22')
Exam.create(date:'2019-4-25', exam_code:'EX0023',module_code:'COM1002',name:'Examination name 23')
Exam.create(date:'2019-4-26', exam_code:'EX0024',module_code:'COM1001',name:'Examination name 24')
Exam.create(date:'2019-4-27', exam_code:'EX0025',module_code:'COM1002',name:'Examination name 25')
Exam.create(date:'2019-4-28', exam_code:'EX0026',module_code:'COM1003',name:'Examination name 26')
Exam.create(date:'2019-4-29', exam_code:'EX0027',module_code:'COM1002',name:'Examination name 27')
Exam.create(date:'2019-5-1', exam_code:'EX0028',module_code:'COM1003',name:'Examination name 28')
Exam.create(date:'2019-5-2', exam_code:'EX0029',module_code:'COM1002',name:'Examination name 29')

Station.create(exam_code:'EX001',pass_mark:70,station_name:'station name 1 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 2 ex001')
Station.create(exam_code:'EX001',pass_mark:50,station_name:'station name 3 ex001')
Station.create(exam_code:'EX001',pass_mark:55,station_name:'station name 4 ex001')

Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 5 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 6 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 7 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 8 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 9 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 10 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 11 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 12 ex001')
Station.create(exam_code:'EX001',pass_mark:60,station_name:'station name 13 ex001')
