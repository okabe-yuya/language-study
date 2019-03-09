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

def insert_event_your_calendar(event_obj, calendar_id=CALENDAR_ID):
  success_key = False
  service = check_scope_and_build("calendar", CALENDAR_SCOPE, "v3")
  event = service.events().insert(calendarId=calendar_id, body=event_obj).execute()
  return success_key