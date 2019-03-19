# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UniModule.create(module_code:'COM1001',module_name:'Computer Science 1')
UniModule.create(module_code:'COM1002',module_name:'Computer Science 2')
UniModule.create(module_code:'COM1003',module_name:'Computer Science 3')

Exam.create(date:'2019-3-19', exam_code:'EX001',module_code:'COM1001',name:'Examination name 1')
Exam.create(date:'2019-3-20', exam_code:'EX002',module_code:'COM1002',name:'Examination name 2')
Exam.create(date:'2019-3-21', exam_code:'EX003',module_code:'COM1003',name:'Examination name 3')
Exam.create(date:'2019-3-19', exam_code:'EX004',module_code:'COM1002',name:'Examination name 4')
Exam.create(date:'2019-3-19', exam_code:'EX005',module_code:'COM1003',name:'Examination name 5')
Exam.create(date:'2019-3-19', exam_code:'EX006',module_code:'COM1001',name:'Examination name 6')
Exam.create(date:'2019-3-19', exam_code:'EX007',module_code:'COM1002',name:'Examination name 7')
Exam.create(date:'2019-3-19', exam_code:'EX008',module_code:'COM1003',name:'Examination name 8')



