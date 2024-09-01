# encoding=utf8
import xlrd
import sys
import selenium


def get_priority_colums(filename, sheetname):
    wb = xlrd.open_workbook(filename, sheetname)
    ws = wb.sheet_by_name(sheetname)

    number_of_rows = ws.nrows
    number_of_columns = ws.ncols

    columns_nunber = 1
    priority_columns = 1
    for column in range(1, number_of_columns):
        checking_column = ws.cell_value(1, columns_nunber)
        if (checking_column != 'MEDIUM'and checking_column != 'HIGH' and checking_column != 'CRITICAL'):
            columns_nunber = columns_nunber + 1
        else:
            priority_columns = columns_nunber
    return priority_columns


