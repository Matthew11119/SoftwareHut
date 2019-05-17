require 'prawn'
class ResultPdf < Prawn::Document
  def initialize(student, exam)
    super(top_margin: 70)
    @student = student
    @exam = exam
    @station_results = StationResult.where( username: @student.username, station_id: @exam.stations.pluck(:id) )
    title
    move_down 10
    pass_exam
    @station_results.each do |station_result|
      line_items(station_result)
    end
  end

  def title
    text "#{@student.forename} #{@student.surname}, #{@exam.name} results", size: 25, style: :bold
  end

  #Create table for station_results
  def line_items(station_result)
    @station_result = station_result
    @station = Station.find(station_result.station_id)
    move_down 20
    text "#{@station.station_name}: " ++ pass_station, size: 15, style: :bold
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
    end
    move_down 10
    text "Station feedback: ", size: 15, style: :bold
    text "#{@station_result.feedback}"
  end

  def line_item_rows
    [["Criteria", "Result", "Feedback"]] +
    @station.criteria.map do |criterium|
      @answer_id = @station_result.criteria_results.where(criterium_id: criterium.id).first.answer
      [criterium.criteria_description,  Answer.find(@answer_id).text , @station_result.criteria_results.where(criterium_id: criterium.id).first.feedback]
    end
  end

  #Method to determine whether a student passes a station
  def pass_station
    if @station_result.mark >= @station.pass_mark
      "Pass"
    else
      "Fail"
    end
  end



  def pass_exam
    result_total = 0
    total_required = 0
    @station_results.each do |station_result|
      result_total += station_result.mark
    end
    @exam.stations.each do |station|
      total_required += station.pass_mark
    end
    if result_total >= total_required
      text "Exam Passed", size: 15, style: :bold
    else
      text "Exam Failed", size: 15, style: :bold
    end
  end



end
