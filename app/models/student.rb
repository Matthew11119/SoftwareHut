# == Schema Information
#
# Table name: students
#
#  forename   :string
#  regno      :integer          not null, primary key
#  surname    :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  has_and_belongs_to_many :uni_modules

  #def self.my_import(file)
  #  columns = [:surname, :forename, :username, :regno]
  #  values = CSV.read(file.path, headers: true)
  #  Student.import columns, values, ignore: true





  def self.my_import(file)
    students = []
    columns = [:surname, :forename, :username, :regno]
    CSV.foreach(file.path, headers: true) do |row|
      if !Student.exists?(row[3])
        students << Student.new(row.to_hash)
      end

    end
    Student.import(columns, students)
  end

end
