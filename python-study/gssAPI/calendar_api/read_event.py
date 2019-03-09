import pickle
import os
import sys
sys.path.append('..')
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
import datetime
from constant.setting import CALENDAR_SCOPE, CALENDAR_ID
from token_auth import check_scope_and_build
FETCH_SHEDULE_NUM_MAX = 10

def fetch_event_your_calendar(calendar_id, fetch_num=FETCH_SHEDULE_NUM_MAX):
  service = check_scope_and_build('calendar', CALENDAR_SCOPE, "v3")
  now = datetime.datetime.utcnow().isoformat() + "Z" # 'Z' indicates UTC time
  print('--> Getting the upcoming {} events'.format(fetch_num))
  events_result = service.events().list(
    calendarId=calendar_id, timeMin=now,
    maxResults=fetch_num, singleEvents=True,
    orderBy='startTime').execute()
  events = events_result.get('items', [])

  return events