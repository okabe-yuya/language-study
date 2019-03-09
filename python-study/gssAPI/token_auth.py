import pickle
import os
import sys
sys.path.append('..')
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
import datetime
# from constant.setting import CALENDAR_SCOPE, SHEET_SCOPE

def check_scope_and_build(mode :str, SCOPE : str, version : str):
  creds = None
  dir_path = "./{}_api/token.pickle".format(mode)
  if os.path.exists(dir_path):
    with open(dir_path, 'rb') as token:
      creds = pickle.load(token)
  if not creds or not creds.valid:
    if creds and creds.expired and creds.refresh_token:
      creds.refresh(Request())
    else:
      flow = InstalledAppFlow.from_client_secrets_file(
        "./{}_api/credentials.json".format(mode),
        SCOPE
      )
    with open(dir_path, 'wb') as token:
      pickle.dump(creds, token)

  service = build(mode, version, credentials=creds)
  return service