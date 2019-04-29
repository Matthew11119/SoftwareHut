require 'prawn'
class ResultPdf < Prawn::Document
  def initialize(student, exam)
    super(top_margin: 70)
    @student = student
    @exam = exam
    @station_results = StationResult.where( username: @student.username, station_id: @exam.stations.pluck(:id) )
    title
    line_items
  end

  def title
    text "#{@student.forename} #{@student.surname} #{@exam.name} results", size: 25, style: :bold
  end

  #Create table for station_results
  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
    end
  end


  def line_item_rows
    [["Station", "Passed", "Feedback"]] +
    @station_results.each do |station|
      [station.name, pass, station.feedback]
    end
  end

  #Method to determine whether a student passes a station
  def pass
    if station_result.mark >= station_result.station.pass_mark
      "Pass"
    else
      "Fail"
    end
  end

end
