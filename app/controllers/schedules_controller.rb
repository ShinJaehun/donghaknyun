class SchedulesController < ApplicationController
  #load_and_authorize_resource

  def index
    #debugger
    @schedule_source = Schedule.first
    #@schedules = Schedule.all.drop(1)
    #Schedule.all.where(entry_date: Time.zone.today.all_week) #오늘을 포함하는 주 schedules
    @schedules = Schedule.all.where(entry_date: Time.zone.today.all_week) #오늘을 포함하는 주 schedules

    @mondays=[]
    Schedule.all.each do |schedule|
      if schedule.entry_date.monday?
        @mondays << schedule.entry_date
      end
    end

    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts @mondays
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  end

  def create
    if !Schedule.all.where(entry_date: Time.zone.today.next_week.all_week).present?
      for i in 0..4
        s=Schedule.create(entry_date: Time.zone.today.next_week + i)
        for i in 1..5
          s.lists.create(name: "#{i}교시", period: i, floor: 3)
        end
        for i in 1..5
          s.lists.create(name: "#{i}교시", period: i, floor: 4)
        end
      end

      respond_to do |format|
        format.html { redirect_to schedules_url, notice: "다음 주 스케줄 추가 성공!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to schedules_url, notice: "이미 다음 주 스케줄이 있는디?" }
      end
    end
  end
end
