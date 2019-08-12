module SlpTimeCycleSelection
  class PeriodicModuleOption < ApplicationRecord
    belongs_to :module_date, class_name: 'SlpTimeCycleSelection::PeriodicModuleDate', foreign_key: 'periodic_module_date_id'
    delegate :periodic_module, to: :module_date

    after_commit :set_option

    private

    def set_option
      return unless start_at

      option.clear
      option << start_at.strftime('%T')
      option << end_at.strftime('T') if start_at.present? && end_at.present?

      temp = option.reduce([]) do |memo, str|
        memo << "'" + str + "'"
      end

      sql = <<-SQL
        update
          slp_time_cycle_selection_periodic_module_options
        set
          option = ARRAY[#{temp.join(',')}]
        where
          id = #{id}
      SQL

      ActiveRecord::Base.connection.execute(sql)
    end
  end
end
