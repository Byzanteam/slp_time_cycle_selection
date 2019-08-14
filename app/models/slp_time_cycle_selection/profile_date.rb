module SlpTimeCycleSelection
  class ProfileDate < ApplicationRecord
    belongs_to :project, class_name: 'SlpTimeCycleSelection::Project'

    def set_workday(date)
      parse_date = Date.parse(date)

      holidays.delete(parse_date) if holidays.include?(parse_date)
      unless workdays.include?(parse_date)
        workdays << Date.parse(date)
        workdays.sort!
        save
      end
    end

    def set_holiday(date)
      parse_date = Date.parse(date)

      workdays.delete(parse_date) if workdays.include?(parse_date)
      unless holidays.include?(parse_date)
        holidays << Date.parse(date)
        holidays.sort!
        save
      end
    end
  end
end
