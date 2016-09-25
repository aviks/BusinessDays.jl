

"""
A calendar with no holidays. But account for weekends.

`isholiday` always returns false for this calendar.
Remember that `isbday` considers that Saturdays and Sundars are not business days.
"""
type WeekendsOnly <: HolidayCalendar end
isholiday(::WeekendsOnly, dt::Date) = false


"""
A calendar with no holidays and no weekends.
Calling `bdays` on this calendar executes a simple date difference (`dt1 - d10`).
"""
type NullHolidayCalendar <: HolidayCalendar end

isholiday(::NullHolidayCalendar, dt::Date) = false
isbday(::NullHolidayCalendar, dt::Date) = false
bdays(::NullHolidayCalendar, dt0::Date, dt1::Date) = dt1 - dt0


include("calendars/brazil.jl")
include("calendars/uk.jl")
include("calendars/us.jl")