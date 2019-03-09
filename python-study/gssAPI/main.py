from sheets_api.gss import fetch_spread_sheet_range_data
from calendar_api.read_event import fetch_event_your_calendar
from calendar_api.make_event_calendar import insert_event_your_calendar
from constant.setting import *

def main(check_key=False):
  """
    1. fetch data from your google spread sheet.
    2. check auth to use google O2auth any SCOPE
    3. to use fetch data, insert your google calendar,
  """
  print("start work...")
  print("--> start fetch from your calendar")
  spread_data = fetch_spread_sheet_range_data(SAMPLE_SPREADSHEET_ID, data_range="A1:E6")
  event_list = make_event_object(spread_data, "YOU")
  for i, event in enumerate(event_list):
    print("--> insert event(num: {}) your schedule in your calendar".format(i+1))
    insert_event_your_calendar(event, CALENDAR_ID)

  if check_key:
    registed_data = fetch_event_your_calendar(CALENDAR_ID, 100)
    display = list(map(lambda x: print("--> event: {}".format(x["start"])), registed_data))
  else:
    print("finished work.....")
    return


def make_event_object(spread_row, your_name, summary=DEFAULT_SUMMARY, location=DEFAULT_LOCATION):
  """
    eg: data sample
    row: [["A", 1, 2], ["you_name", "12:30~14:00", "17:00~19:00"]]....
  """
  def event_object(summary, location, start, end, time_zone_default=True):
    if time_zone_default:
      time_zone = "Asia/Tokyo"
    event_obj = {
      "summary": summary,
      "location": location,
      "start": {
        "dateTime": start,
        "timeZone": time_zone,
      },
      "end": {
        "dateTime": end,
        "timeZone": time_zone,
      }
    }
    return event_obj

  day_list = spread_row[0]
  your_schedule = list(filter(lambda x: your_name in x, spread_row))
  event_list = list()
  for day, day_event in zip(day_list, your_schedule[0]):
    start = "2019-02-15T15:30:00+09:00" #tmp data for move check
    end = "2019-02-15T18:30:00+09:00"
    event_obj = event_object(summary, location, start, end)
    event_list.append(event_obj)
  return event_list

if __name__=="__main__":
  main(True)