import pickle
import os
import sys
sys.path.append('..')
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from constant.setting import SAMPLE_SPREADSHEET_ID, SHEET_SCOPE
from token_auth import check_scope_and_build

def fetch_spread_sheet_range_data(sheet_id, data_range :str):
  service = check_scope_and_build("sheets", SHEET_SCOPE, "v4")

  ## call the Sheet API
  sheet = service.spreadsheets()
  result = sheet.values().get(
    spreadsheetId=sheet_id,
    range=data_range
  ).execute()

  values = result.get('values', [])

  return values