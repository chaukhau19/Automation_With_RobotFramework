# encoding=utf8
import xlrd
import sys
import selenium

def read_excel_file(filename, sheetname, priority, priority_column):
    wb = xlrd.open_workbook(filename, sheetname)
    ws = wb.sheet_by_name(sheetname)
    #for sheet in wb.sheets():
    #for sheet in ws:
        #number_of_rows = ws.nrows
        #number_of_columns = ws.ncols


    number_of_rows = ws.nrows
    number_of_columns = ws.ncols
        #rowStartIndex = 1
        #colStartIndex = 0
    data = []
    #priority_column = priority

        #rows = []
    for row in range(1, number_of_rows):
        current_priority = ws.cell_value(row, priority_column)

        isRunning = False
        if (priority == 'MEDIUM'):
            isRunning = True
        elif (priority == 'HIGH' and (current_priority.strip() == 'HIGH' or current_priority.strip() == 'CRITICAL')):
            isRunning = True
        elif (priority == 'CRITICAL' and current_priority.strip() == 'CRITICAL'):
            isRunning = True
        if (isRunning == True):
            values = []
            for col in range(number_of_columns):
                value = (ws.cell(row,col).value)
                try:
                    value = str(int(value))

                except ValueError:
                    pass
                finally:
                    values.append(value)
            print(values)
            data.append(values)
    return data

